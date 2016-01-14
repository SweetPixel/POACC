(function() {
  var bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  this.SpudTinyMCE = (function() {
    SpudTinyMCE.registeredPlugins = ['autolink', 'lists', 'layer', 'table', 'tableDropdown', 'advhr', 'advimage', 'advlink', 'iespell', 'inlinepopups', 'media', 'paste'];

    SpudTinyMCE.registeredButtons = [['bold', 'italic', 'underline', 'strikethrough', '|', 'justifyleft', 'justifycenter', 'justifyright', 'justifyfull', '|', 'formatselect', 'cut', 'copy', 'paste', 'pastetext', '|', 'bullist', 'numlist', 'outdent', 'indent', '|', 'tableDropdown', '|', 'link', 'unlink', 'anchor', 'image', 'code'], [], [], []];

    SpudTinyMCE.validElements = "@[id|class|style|title|dir<ltr?rtl|lang|xml::lang|onclick|ondblclick|" + "onmousedown|onmouseup|onmouseover|onmousemove|onmouseout|onkeypress|" + "onkeydown|onkeyup],a[rel|rev|charset|hreflang|tabindex|accesskey|type|" + "name|href|target|title|class|onfocus|onblur],strong/b,em/i,strike,u," + "#p,-ol[type|compact],-ul[type|compact],-li,br,img[longdesc|usemap|" + "src|border|alt=|title|hspace|vspace|width|height|align|hidpi_src],-sub,-sup," + "-blockquote,-table[border=0|cellspacing|cellpadding|width|frame|rules|" + "height|align|summary|bgcolor|background|bordercolor],-tr[rowspan|width|" + "height|align|valign|bgcolor|background|bordercolor],tbody,thead,tfoot," + "#td[colspan|rowspan|width|height|align|valign|bgcolor|background|bordercolor" + "|scope],#th[colspan|rowspan|width|height|align|valign|scope],caption,-div," + "-span,-code,-pre,address,-h1,-h2,-h3,-h4,-h5,-h6,hr[size|noshade],-font[face" + "|size|color],dd,dl,dt,cite,abbr,acronym,del[datetime|cite],ins[datetime|cite]," + "object[classid|width|height|codebase|*],param[name|value|_value],embed[type|width" + "|height|src|*],script[src|type],map[name],area[shape|coords|href|alt|target],bdo," + "button,col[align|char|charoff|span|valign|width],colgroup[align|char|charoff|span|" + "valign|width],dfn,fieldset,form[action|accept|accept-charset|enctype|method]," + "input[accept|alt|checked|disabled|maxlength|name|readonly|size|src|type|value]," + "kbd,label[for],legend,noscript,optgroup[label|disabled],option[disabled|label|selected|value]," + "q[cite],samp,select[disabled|multiple|name|size],small," + "textarea[cols|rows|disabled|name|readonly],tt,var,big";

    SpudTinyMCE.extendedValidElements = [];

    SpudTinyMCE.validFormats = "p,h1,h2,h3,h4,h5,h6";

    SpudTinyMCE.defaultTheme = 'advanced';

    SpudTinyMCE.prototype.editor = null;

    function SpudTinyMCE(element1, options) {
      var contentCss, height, theme;
      this.element = element1;
      this.unload = bind(this.unload, this);
      this.assignId = bind(this.assignId, this);
      options = options || {};
      if (!this.element.attr('id')) {
        this.assignId();
      }
      contentCss = $(this.element).data('content-css');
      theme = options.theme || this.constructor.defaultTheme;
      height = options.height || 400;
      console.log("Loading Css " + contentCss);
      $(this.element).tinymce({
        theme: theme,
        content_css: contentCss,
        plugins: this.constructor.registeredPlugins.join(","),
        theme_advanced_toolbar_location: "top",
        theme_advanced_buttons1: this.constructor.registeredButtons[0].join(','),
        theme_advanced_buttons2: this.constructor.registeredButtons[1].join(','),
        theme_advanced_buttons3: this.constructor.registeredButtons[2].join(','),
        theme_advanced_buttons4: this.constructor.registeredButtons[3].join(','),
        theme_advanced_toolbar_align: 'left',
        theme_advanced_blockformats: this.constructor.validFormats,
        convert_urls: false,
        valid_elements: SpudTinyMCE.validElements,
        media_strict: false,
        extended_valid_elements: this.constructor.extendedValidElements.join(","),
        width: '100%',
        height: height
      });
    }

    SpudTinyMCE.prototype.assignId = function() {
      var baseId, counter;
      baseId = "spud-tinymce-";
      counter = 1;
      while ($("#" + baseId + counter).length) {
        counter += 1;
      }
      return this.element.attr('id', "" + baseId + counter);
    };

    SpudTinyMCE.prototype.unload = function() {
      return tinyMCE.execCommand('mceRemoveControl', false, this.element.attr('id'));
    };

    SpudTinyMCE.appendValidElement = function(element) {
      return SpudTinyMCE.extendedValidElements.push(element);
    };

    SpudTinyMCE.registerButton = function(buttonNameOrArray, rowNum) {
      rowNum = rowNum || 0;
      if (typeof buttonNameOrArray === 'object') {
        return SpudTinyMCE.registeredButtons[rowNum].concat(buttonNameOrArray);
      } else {
        return SpudTinyMCE.registeredButtons[rowNum].push(buttonNameOrArray);
      }
    };

    SpudTinyMCE.registerPlugin = function(pluginName) {
      if ($.inArray(SpudTinyMCE.registeredPlugins, pluginName) < 0) {
        return SpudTinyMCE.registeredPlugins.push(pluginName);
      }
    };

    SpudTinyMCE.deregisterPlugin = function(pluginName) {
      var i, j, len, plugin, ref, results;
      ref = SpudTinyMCE.registeredPlugins;
      results = [];
      for (i = j = 0, len = ref.length; j < len; i = ++j) {
        plugin = ref[i];
        if (!(plugin === pluginName)) {
          continue;
        }
        SpudTinyMCE.registeredPlugins.splice(i, 1);
        break;
      }
      return results;
    };

    return SpudTinyMCE;

  })();

  this.spud.admin.editor.registerEditor('html', this.SpudTinyMCE);

}).call(this);
