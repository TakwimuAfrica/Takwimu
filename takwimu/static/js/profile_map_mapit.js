var ProfileMaps = function() {
    var self = this;
    this.mapit_url = GeometryLoader.mapit_url;
    this.mapit_codetype = GeometryLoader.mapit_codetype;
    this.mapit_country = GeometryLoader.mapit_country;

    this.featureGeoStyle = {
        "fillColor": "#66c2a5",
        "color": "#777",
        "weight": 2,
        "opacity": 0.3,
        "fillOpacity": 0.5,
        "clickable": false
    };

    this.layerStyle = {
        "clickable": true,
        "color": "#00d",
        "fillColor": "#ccc",
        "weight": 1.0,
        "opacity": 0.3,
        "fillOpacity": 0.3,
    };

    this.hoverStyle = {
        "fillColor": "#66c2a5",
        "fillOpacity": 0.7,
    };

    this.drawMapsForProfile = function(geo) {
        this.geo = geo;
        this.createMap();
        this.addImagery();
        this.drawAllFeatures();
    };

    this.drawMapForHomepage = function(geo_level, geo_version, centre, zoom) {
        // draw a homepage map, but only for big displays
        if (browserWidth < 768 || $('#slippy-map').length === 0) return;

        this.createMap();
        this.addImagery();
        if (centre) {
            self.map.setView(centre, zoom);
        }
        GeometryLoader.loadGeometryForLevel(geo_level, 'TZ', geo_version, function(features) {
            console.log("drawing homepage");
            console.log(features);
            var layer = self.drawFeatures(features.features);
            if (!centre) {
                self.map.fitBounds(layer.getBounds());
            }
        });
    };

    this.createMap = function() {
        var allowMapDrag = (browserWidth > 480) ? true : false;

        this.map = L.map('slippy-map', {
            scrollWheelZoom: false,
            zoomControl: false,
            doubleClickZoom: false,
            boxZoom: false,
            keyboard: false,
            dragging: allowMapDrag,
            touchZoom: allowMapDrag
        });

        if (allowMapDrag) {
            this.map.addControl(new L.Control.Zoom({
                position: 'topright'
            }));
        }
    };

    this.addImagery = function() {
        // add imagery
        L.tileLayer('//{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
          attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>',
          subdomains: 'abc',
          maxZoom: 17
        }).addTo(this.map);
    };

    this.drawAllFeatures = function() {
        var geo_level = this.geo.this.geo_level;
        var geo_code = this.geo.this.geo_code;
        var geo_version = this.geo.this.version;
        var osm_area_id = this.geo.this.osm_area_id;
        var child_level = this.geo.this.child_level;
        var geo_name = this.geo.this.name;

        // if we are in a root geo, only setView
        if (Object.getOwnPropertyNames(this.geo.parents).length==0) {
            this.map.setView( this.mapit_country.centre, this.mapit_country.zoom);
        } else {
            // draw the current geo
            GeometryLoader.loadGeometryForGeo(geo_level, geo_code, geo_version, function(feature) {
              self.drawFocusFeature(feature);
            });
        }

        // draw the others at this level
        GeometryLoader.loadGeometryForLevel(geo_level, geo_code, geo_version, function(features) {
            self.drawFeatures(features.features);

            // load shapes at the child level, if any once all features all drawn
            if (child_level) {
                GeometryLoader.loadGeometryForChildLevel(child_level, geo_level, geo_code, geo_version, function(features) {
                    self.drawFeatures(features.features);
                });
            }
        });


    };

    this.drawFocusFeature = function(feature) {
        var layer = L.geoJson([feature], {
            style: self.featureGeoStyle,
        });
        this.map.addLayer(layer);
        var objBounds = layer.getBounds();

        if (browserWidth > 768) {
            var z;
            for(z = 16; z > 2; z--) {
                var swPix = this.map.project(objBounds.getSouthWest(), z),
                    nePix = this.map.project(objBounds.getNorthEast(), z),
                    pixWidth = Math.abs(nePix.x - swPix.x),
                    pixHeight = Math.abs(nePix.y - swPix.y);
                if (pixWidth <  500 && pixHeight < 400) {
                    break;
                }
            }
            this.map.setView(layer.getBounds().getCenter(), z);
            this.map.panBy([-270, 0], {animate: false});
        } else {
            this.map.fitBounds(layer.getBounds());
        }
    };

    this.drawFeatures = function(features) {
        // draw all others
        var url = this.mapit_url;
        var mapit_codetype = this.mapit_codetype;

        return L.geoJson(features, {
            style: this.layerStyle,
            onEachFeature: function(feature, layer) {
                layer.bindLabel(feature.properties.name, {direction: 'auto'});

                layer.on('mouseover', function() {
                    layer.setStyle(self.hoverStyle);
                });
                layer.on('mouseout', function() {
                    layer.setStyle(self.layerStyle);
                });
                layer.on('click', function() {
                  var uri = '/areas/'+ feature.properties.name.toLowerCase() + '?generation=1' + '&type=';
                  uri = uri + feature.properties.area_type.toUpperCase();

                  if (feature.properties.country_code)
                    uri = uri +  '&country='+ feature.properties.country_code;

                  console.log(uri);
                  d3.json(url + uri,  function(error, data) {
                    if (error) return console.warn(error);
                    var featureInfo = Object.values(data);

                    var geo_id = featureInfo[0]['codes'][mapit_codetype];
                    console.log(geo_id)
                    //var geo_level = featureInfo[0]['type'];
                    window.location = '/profiles/' + geo_id + '/';
                  });

                });
            },
        }).addTo(this.map);
    };
};
