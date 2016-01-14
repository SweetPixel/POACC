(function() {
  var editor;

  spud.admin.editor = {
    editors: {},
    instances: []
  };

  editor = this.spud.admin.editor;

  editor.init = function(options) {
    var selector;
    editor.monitorFormatters();
    options = options || {};
    selector = options.selector || 'textarea.spud-formatted-editor';
    return $(selector).each(function() {
      return editor.initializeEditorForElement(this);
    });
  };

  editor.initializeEditorForElement = function(element) {
    var $element, dataFormat, editorClass, instance;
    $element = $(element);
    if ($element.id && editorInstanceForId($element.id)) {
      console.warn("Spud Formatted Editor " + $element.id + " already initialized!");
      return;
    }
    dataFormat = $element.data('format') || 'html';
    dataFormat = dataFormat.toLowerCase();
    editorClass = editor.editors[dataFormat];
    if (editorClass) {
      instance = new editorClass($element);
      return editor.instances.push(instance);
    } else {
      return console.error("Editor not found for the requested Format!");
    }
  };

  editor.registerEditor = function(format, editorObject, override) {
    if (editor.editors[format] && !override) {
      log.warn("An Editor is Already Defined For the specified Format");
      return;
    }
    return editor.editors[format] = editorObject;
  };

  editor.deregisterEditor = function(format) {
    return delete editor.editors[format];
  };

  editor.monitorFormatters = function() {
    $('select[data-formatter]').off('change.spud');
    return $('select[data-formatter]').on('change.spud', editor.formatterChanged);
  };

  editor.formatterChanged = function() {
    var targetEditor, targetEditorId;
    targetEditorId = $(this).data('formatter');
    targetEditor = $("#" + targetEditorId);
    editor.unload(targetEditorId);
    targetEditor.data('format', $(this).val());
    return editor.initializeEditorForElement(targetEditor);
  };

  editor.editorInstanceForId = function(id) {
    var i, instance, len, ref;
    ref = editor.instances;
    for (i = 0, len = ref.length; i < len; i++) {
      instance = ref[i];
      if (instance.element.attr('id') === id) {
        return instance;
      }
    }
    return null;
  };

  editor.unload = function(id) {
    var instance, results;
    if (id) {
      instance = editor.editorInstanceForId(id);
      if (instance) {
        instance.unload();
        return editor.instances.splice(editor.instances.indexOf(instance), 1);
      }
    } else {
      results = [];
      while (editor.instances.length > 0) {
        results.push(editor.instances.pop().unload());
      }
      return results;
    }
  };

}).call(this);
