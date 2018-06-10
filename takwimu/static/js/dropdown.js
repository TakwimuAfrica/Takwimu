jQuery(document).ready(function($) {
  function morphDropdown(element) {
    this.element = element;
    this.mainNavigation = this.element.find(".navbar");
    this.mainNavigationItems = this.mainNavigation.find(".has-dropdown");
    this.dropdownList = this.element.find(".dropdown-list");
    this.dropdownWrappers = this.dropdownList.find(".dropdown-item");
    this.dropdownItems = this.dropdownList.find(".content");
    this.mq = this.checkMq();
    this.bindEvents();
  }

  morphDropdown.prototype.checkMq = function() {
    //check screen size
    var self = this;
    return window
      .getComputedStyle(self.element.get(0), "::before")
      .getPropertyValue("content")
      .replace(/'/g, "")
      .replace(/"/g, "")
      .split(", ");
  };

  morphDropdown.prototype.bindEvents = function() {
    var self = this;
    //hover over an item in the main navigation
    this.mainNavigationItems
      .mouseenter(function(event) {
        //hover over one of the nav items -> show dropdown
        self.showDropdown($(this));
      })
      .mouseleave(function() {
        setTimeout(function() {
          //if not hovering over a nav item or a dropdown -> hide dropdown
          if (
            self.mainNavigation.find(".has-dropdown:hover").length == 0 &&
            self.element.find(".dropdown-list:hover").length == 0
          )
            self.hideDropdown();
        }, 50);
      });

    //hover over the dropdown
    this.dropdownList.mouseleave(function() {
      setTimeout(function() {
        //if not hovering over a dropdown or a nav item -> hide dropdown
        self.mainNavigation.find(".has-dropdown:hover").length == 0 &&
          self.element.find(".dropdown-list:hover").length == 0 &&
          self.hideDropdown();
      }, 50);
    });
  };

  morphDropdown.prototype.showDropdown = function(item) {
    this.mq = this.checkMq();
    if (this.mq == "desktop") {
	  var self = this;
      var selectedDropdown = this.dropdownList.find("#" + item.data("content")),
        selectedDropdownHeight = selectedDropdown.innerHeight(),
        selectedDropdownWidth = selectedDropdown
          .children(".content")
          .innerWidth(),
        selectedDropdownLeft =
          item.offset().left +
          item.innerWidth() / 2 -
          selectedDropdownWidth / 2;

      //update dropdown position and size
      this.updateDropdown(
        selectedDropdown,
        parseInt(selectedDropdownHeight),
        100,
        0
        // selectedDropdownWidth,
        // parseInt(selectedDropdownLeft)
      );
      //add active class to the proper dropdown item
      this.element.find(".active").removeClass("active");
      selectedDropdown
        .addClass("active")
        .removeClass("move-left move-right")
        .prevAll()
        .addClass("move-left")
        .end()
        .nextAll()
        .addClass("move-right");
      item.addClass("active");
      //show the dropdown wrapper if not visible yet
      if (!this.element.hasClass("is-dropdown-visible")) {
        setTimeout(function() {
          self.element.addClass("is-dropdown-visible");
        }, 10);
      }
    }
  };

  morphDropdown.prototype.updateDropdown = function(
    dropdownItem,
    height,
    width,
    left
  ) {
    this.dropdownList.css({
      width: width + "vw",
      height: height + "px"
    });
  };

  morphDropdown.prototype.hideDropdown = function() {
    this.mq = this.checkMq();
    if (this.mq == "desktop") {
      this.element
        .removeClass("is-dropdown-visible")
        .find(".active")
        .removeClass("active")
        .end()
        .find(".move-left")
        .removeClass("move-left")
        .end()
        .find(".move-right")
        .removeClass("move-right");
    }
  };

  morphDropdown.prototype.resetDropdown = function() {
    this.mq = this.checkMq();
    if (this.mq == "mobile") {
      this.dropdownList.removeAttr("style");
    }
  };

  var morphDropdowns = [];
  if ($(".morph-dropdown").length > 0) {
    $(".morph-dropdown").each(function() {
      //create a morphDropdown object for each .morph-dropdown
      morphDropdowns.push(new morphDropdown($(this)));
    });

    var resizing = false;

    //on resize, reset dropdown style property
    updateDropdownPosition();
    $(window).on("resize", function() {
      if (!resizing) {
        resizing = true;
        !window.requestAnimationFrame
          ? setTimeout(updateDropdownPosition, 300)
          : window.requestAnimationFrame(updateDropdownPosition);
      }
    });

    function updateDropdownPosition() {
      morphDropdowns.forEach(function(element) {
        element.resetDropdown();
      });

      resizing = false;
    }
  }
});
