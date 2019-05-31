/***
 * A class that loads geography boundary information from
 * mapit.code4sa.org.
 */
function MapItGeometryLoader() {
    var self = this;
    self.mapit_url = MAPIT.url;
    self.mapit_codetype = MAPIT.code_type;
    self.mapit_country = MAPIT.map_country;
    /**
     * Fetches geometry data for a comparison view and calls the +success+
     * callback with an object mapping each geo-id to a GeoJSON object.
     */
     this.loadGeometryForComparison = function(comparison, success) {
         // load all country, province, municipality and ward geo data
         var counter = comparison.geoIDs.length;
         var featureMap = {};
         var generation = MAPIT.generations[comparison.geoVersion];

         _.each(comparison.geoIDs, function(geoid) {
             // eg. province-WC
             var parts = geoid.split('-'),
                 level = parts[0],
                 code = geoid,
                 url_ = '/code/' + self.mapit_codetype + '/' + code;

             var simplify = MAPIT.level_simplify[level];
             var mapit_codetype = this.mapit_codetype;

             url_ = url_ + "?generation=" + generation;
             d3.json(this.mapit_url + url_, function(error, data) {
               if (error) return console.warn(error);
               var area = data;
               var url = '/area/' + area.id + '.geojson?type=' + area.type + "&country=" + area.country+ '&simplify_tolerance='+ simplify;
               d3.json(self.mapit_url + url, function(error, geojson) {
                   --counter;
                   if (error) return console.warn(error);
                   var features = geojson.features;
                   feature.properties = {}
                   feature.properties['area_id'] = area.id;
                   _.each(features, function(feature) {
                     self.decorateFeature(feature, area.type, area.country);
                   });

                   // index by geoid
                   _.each(features, function(feature) {
                       featureMap[feature.properties.geoid] = feature;
                   });

                   if (counter === 0) {
                       // collect those we're interested in
                       var usefulFeatures = {};

                       _.each(comparison.dataGeoIDs, function(geoid) {
                           var feature = featureMap[geoid];
                           feature.properties.name = comparison.data.geography[geoid].name;
                           usefulFeatures[geoid] = feature;
                       });
                       success(usefulFeatures);
                   }
               });
             });
         });
     };

    this.decorateFeature = function(feature, area_type, country) {
        feature.properties.area_type = area_type;
        feature.properties.country_code = country;
    };

    this.loadGeometryForLevel = function(level, geo_code, geo_version, success) {
        var generation = MAPIT.generations[geo_version];
        var simplify = MAPIT.level_simplify[level];
        var mapit_codetype = this.mapit_codetype;

        var uri ="/code/" + mapit_codetype + "/" + level + "-"+ geo_code+"?generation=" + generation;

        d3.json(this.mapit_url + uri, function(error, data) {
          if (error) return console.warn(error);
          let area_type = data.type;
          var area_country = data.country;

          var url_ = '/areas/' + area_type + '?generation=' + generation;

          //if we need to draw country level let's not filter with country
          if (level == 'country')
            area_country=''
          else
            url_ = url_ + '&country=' + area_country;

          console.log(url_)
          d3.json(self.mapit_url + url_, function(error, data) {
            var areas = Object.keys(data);
            areas = areas.join();
            var url = '/areas/' + areas + '.geojson';

            d3.json(self.mapit_url + url, function(error, geojson) {
                var features = _.values(geojson.features);
                _.each(features, function(feature) {
                  self.decorateFeature(feature, area_type, area_country);
                });
                success({features: features});
            });

          });

        });
    };
    this.loadGeometryForChildLevel = function(childlevel, level, geo_code, geo_version, success) {
        var generation = MAPIT.generations[geo_version];
        var simplify = MAPIT.level_simplify[childlevel];
        var mapit_codetype = this.mapit_codetype;

        var url_ ="/code/" + mapit_codetype + "/" + level + "-"+ geo_code;
        url_ = url_ + "?generation=" + generation;


        d3.json(this.mapit_url + url_, function(error, data) {
          if (error) return console.warn(error);
          let area = data;
          var area_country = area.country;
          var area_type = area.type;
          let url = '/area/' + area.id + '/children';

          //if level is continent pass an empty value for area_country
          if (level == 'continent')
            area_country=''

          d3.json(self.mapit_url + url, function(error, json) {
            let children_Ids = Object.keys(json);
            let children = Object.values(json);
            let child_type = children[0].type;

            children_Ids = children_Ids.join();
            let children_url = '/areas/' + children_Ids + '.geojson';
            console.log(area_country)
            console.log(child_type)

            d3.json(self.mapit_url + children_url, function(error, geojson) {
                let features = _.values(geojson.features);
                _.each(features, function(feature) {
                  self.decorateFeature(feature, child_type, area_country);
                });
                success({features: features});
            });

          });

        });
    };

    this.loadGeometryForGeo = function(geo_level, geo_code, geo_version, success) {
        var mapit_type = geo_level.toUpperCase();
        var simplify = MAPIT.level_simplify[geo_level];
        var generation = MAPIT.generations[geo_version];
        var mapit_codetype = this.mapit_codetype;
        var country_code = this.mapit_countrycode;

        var url_ ="/code/" + mapit_codetype + "/" + geo_level + "-" + geo_code;
        url_ = url_ + "?generation=" + generation;

        d3.json(this.mapit_url + url_, function(error, data) {
          if (error) return console.warn(error);
          var area = data;
          var url = '/area/' + area.id + '.geojson?type=' + mapit_type + "&country=" + country_code;
          d3.json(self.mapit_url + url, function(error, feature) {
              if (error) return console.warn(error);
              feature.properties = {}
              feature.properties['area_id'] = area.id;
              success(feature);
          });
        });
    };

    this.loadGeometrySet = function(levelset, level, geo_version, success) {
        var generation = MAPIT.generations[geo_version];
        var url_ = '/areas/' + level.toUpperCase();
        url_ = url_ + '?generation=' + generation + '&country=' + MAPIT.country_code;

        d3.json(this.mapit_url + url_, function(error, data) {
          var areas = Object.keys(data);
          areas = areas.join();
          var url = '/areas/' + areas + '.geojson';

          d3.json(self.mapit_url + url, function(error, geojson) {
              var features = _.values(geojson.features);
              _.each(features, function(feature) {
                self.decorateFeature(feature, level, MAPIT.country_code);
              });
              success({features: features});
          });

        });
    };
}

GeometryLoader = new MapItGeometryLoader();
