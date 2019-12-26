/*
    A simple jQuery modal2 (http://github.com/kylefox/jquery-modal2)
    Version 0.9.1
*/

(function (factory) {
  // Making your jQuery plugin work better with npm tools
  // http://blog.npmjs.org/post/112712169830/making-your-jquery-plugin-work-better-with-npm
  if(typeof module === "object" && typeof module.exports === "object") {
    factory(require("jquery"), window, document);
  }
  else {
    factory(jQuery, window, document);
  }
}(function($, window, document, undefined) {

  var modal2s = [],
      getCurrent = function() {
        return modal2s.length ? modal2s[modal2s.length - 1] : null;
      },
      selectCurrent = function() {
        var i,
            selected = false;
        for (i=modal2s.length-1; i>=0; i--) {
          if (modal2s[i].$blocker) {
            modal2s[i].$blocker.toggleClass('current',!selected).toggleClass('behind',selected);
            selected = true;
          }
        }
      };

  $.modal2 = function(el, options) {
    var remove, target;
    this.$body = $('body');
    this.options = $.extend({}, $.modal2.defaults, options);
    this.options.doFade = !isNaN(parseInt(this.options.fadeDuration, 10));
    this.$blocker = null;
    if (this.options.closeExisting)
      while ($.modal2.isActive())
        $.modal2.close(); // Close any open modal2s.
    modal2s.push(this);
    if (el.is('a')) {
      target = el.attr('href');
      this.anchor = el;
      //Select element by id from href
      if (/^#/.test(target)) {
        this.$elm = $(target);
        if (this.$elm.length !== 1) return null;
        this.$body.append(this.$elm);
        this.open();
      //AJAX
      } else {
        this.$elm = $('<div>');
        this.$body.append(this.$elm);
        remove = function(event, modal2) { modal2.elm.remove(); };
        this.showSpinner();
        el.trigger($.modal2.AJAX_SEND);
        $.get(target).done(function(html) {
          if (!$.modal2.isActive()) return;
          el.trigger($.modal2.AJAX_SUCCESS);
          var current = getCurrent();
          current.$elm.empty().append(html).on($.modal2.CLOSE, remove);
          current.hideSpinner();
          current.open();
          el.trigger($.modal2.AJAX_COMPLETE);
        }).fail(function() {
          el.trigger($.modal2.AJAX_FAIL);
          var current = getCurrent();
          current.hideSpinner();
          modal2s.pop(); // remove expected modal2 from the list
          el.trigger($.modal2.AJAX_COMPLETE);
        });
      }
    } else {
      this.$elm = el;
      this.anchor = el;
      this.$body.append(this.$elm);
      this.open();
    }
  };

  $.modal2.prototype = {
    constructor: $.modal2,

    open: function() {
      var m = this;
      this.block();
      this.anchor.blur();
      if(this.options.doFade) {
        setTimeout(function() {
          m.show();
        }, this.options.fadeDuration * this.options.fadeDelay);
      } else {
        this.show();
      }
      $(document).off('keydown.modal2').on('keydown.modal2', function(event) {
        var current = getCurrent();
        if (event.which === 27 && current.options.escapeClose) current.close();
      });
      if (this.options.clickClose)
        this.$blocker.click(function(e) {
          if (e.target === this)
            $.modal2.close();
        });
    },

    close: function() {
      modal2s.pop();
      this.unblock();
      this.hide();
      if (!$.modal2.isActive())
        $(document).off('keydown.modal2');
    },

    block: function() {
      this.$elm.trigger($.modal2.BEFORE_BLOCK, [this._ctx()]);
      this.$body.css('overflow','hidden');
      this.$blocker = $('<div class="' + this.options.blockerClass + ' blocker current"></div>').appendTo(this.$body);
      selectCurrent();
      if(this.options.doFade) {
        this.$blocker.css('opacity',0).animate({opacity: 1}, this.options.fadeDuration);
      }
      this.$elm.trigger($.modal2.BLOCK, [this._ctx()]);
    },

    unblock: function(now) {
      if (!now && this.options.doFade)
        this.$blocker.fadeOut(this.options.fadeDuration, this.unblock.bind(this,true));
      else {
        this.$blocker.children().appendTo(this.$body);
        this.$blocker.remove();
        this.$blocker = null;
        selectCurrent();
        if (!$.modal2.isActive())
          this.$body.css('overflow','');
      }
    },

    show: function() {
      this.$elm.trigger($.modal2.BEFORE_OPEN, [this._ctx()]);
      if (this.options.showClose) {
        this.closeButton = $('<a href="#close-modal2" rel="modal2:close" class="close-modal2 ' + this.options.closeClass + '">' + this.options.closeText + '</a>');
        this.$elm.append(this.closeButton);
      }
      this.$elm.addClass(this.options.modal2Class).appendTo(this.$blocker);
      if(this.options.doFade) {
        this.$elm.css({opacity: 0, display: 'inline-block'}).animate({opacity: 1}, this.options.fadeDuration);
      } else {
        //this.$elm.css('display', 'inline-block');
    	  this.$elm.css({width: '300px', display: 'inline-block'});
      }
      this.$elm.trigger($.modal2.OPEN, [this._ctx()]);
    },

    hide: function() {
      this.$elm.trigger($.modal2.BEFORE_CLOSE, [this._ctx()]);
      if (this.closeButton) this.closeButton.remove();
      var _this = this;
      if(this.options.doFade) {
        this.$elm.fadeOut(this.options.fadeDuration, function () {
          _this.$elm.trigger($.modal2.AFTER_CLOSE, [_this._ctx()]);
        });
      } else {
        this.$elm.hide(0, function () {
          _this.$elm.trigger($.modal2.AFTER_CLOSE, [_this._ctx()]);
        });
      }
      this.$elm.trigger($.modal2.CLOSE, [this._ctx()]);
    },

    showSpinner: function() {
      if (!this.options.showSpinner) return;
      this.spinner = this.spinner || $('<div class="' + this.options.modal2Class + '-spinner"></div>')
        .append(this.options.spinnerHtml);
      this.$body.append(this.spinner);
      this.spinner.show();
    },

    hideSpinner: function() {
      if (this.spinner) this.spinner.remove();
    },

    //Return context for custom events
    _ctx: function() {
      return { elm: this.$elm, $elm: this.$elm, $blocker: this.$blocker, options: this.options };
    }
  };

  $.modal2.close = function(event) {
    if (!$.modal2.isActive()) return;
    if (event) event.preventDefault();
    var current = getCurrent();
    current.close();
    return current.$elm;
  };

  // Returns if there currently is an active modal2
  $.modal2.isActive = function () {
    return modal2s.length > 0;
  };

  $.modal2.getCurrent = getCurrent;

  $.modal2.defaults = {
    closeExisting: true,
    escapeClose: true,
    clickClose: true,
    closeText: 'Close',
    closeClass: '',
    modal2Class: "modal2",
    blockerClass: "jquery-modal2",
    spinnerHtml: '<div class="rect1"></div><div class="rect2"></div><div class="rect3"></div><div class="rect4"></div>',
    showSpinner: true,
    showClose: true,
    fadeDuration: null,   // Number of milliseconds the fade animation takes.
    fadeDelay: 1.0        // Point during the overlay's fade-in that the modal2 begins to fade in (.5 = 50%, 1.5 = 150%, etc.)
  };

  // Event constants
  $.modal2.BEFORE_BLOCK = 'modal2:before-block';
  $.modal2.BLOCK = 'modal2:block';
  $.modal2.BEFORE_OPEN = 'modal2:before-open';
  $.modal2.OPEN = 'modal2:open';
  $.modal2.BEFORE_CLOSE = 'modal2:before-close';
  $.modal2.CLOSE = 'modal2:close';
  $.modal2.AFTER_CLOSE = 'modal2:after-close';
  $.modal2.AJAX_SEND = 'modal2:ajax:send';
  $.modal2.AJAX_SUCCESS = 'modal2:ajax:success';
  $.modal2.AJAX_FAIL = 'modal2:ajax:fail';
  $.modal2.AJAX_COMPLETE = 'modal2:ajax:complete';

  $.fn.modal2 = function(options){
    if (this.length === 1) {
      new $.modal2(this, options);
    }
    return this;
  };

  // Automatically bind links with rel="modal2:close" to, well, close the modal2.
  $(document).on('click.modal2', 'a[rel~="modal2:close"]', $.modal2.close);
  $(document).on('click.modal2', 'a[rel~="modal2:open"]', function(event) {
    event.preventDefault();
    $(this).modal2();
  });
}));
