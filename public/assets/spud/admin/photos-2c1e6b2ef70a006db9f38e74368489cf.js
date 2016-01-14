Spud = (typeof(Spud) == 'undefined') ? {} : Spud;
Spud.Admin = (typeof(Spud.Admin) == 'undefined') ? {} : Spud.Admin;

Spud.Admin.Photos = new function(){

  var self = this;
  var html5upload = false;

  this.init = function(){
    // event handlers
    $('.spud_admin_photo_ui_thumbs_sortable').sortable({
      connectWith:'.spud_admin_photo_ui_thumbs_sortable'
    });
    $('body').on('submit', '#spud_admin_photo_album_form', self.submittedPhotoAlbumForm);
    $('body').on('submit', '#spud_admin_photo_gallery_form', self.submittedPhotoGalleryForm);
    $('body').on('submit', '#spud_admin_photo_form', self.submittedPhotoForm);
    $('body').on('click', '.spud_admin_photos_btn_remove', self.clickedPhotoRemoveFromAlbum);
    $('body').on('click', '.spud_admin_photo_ui_thumbs_selectable .spud_admin_photo_ui_thumb', self.selectedPhotoUiThumb);
    $('body').on('click', '#spud_admin_photo_album_action_library', self.clickedPhotoLibrary);
    $('body').on('click', '#spud_admin_photo_album_action_upload, .spud_admin_photo .spud_admin_photos_btn_edit', self.clickedPhotoAddOrEdit);
    $('body').on('click', '.spud_admin_photo_library_add_selected', self.addSelectedPhotosFromLibrary);
    $('body').on('click', '.spud_admin_photo_library_delete_selected', self.deleteSelectedPhotosFromLibrary);

    // html5 drag and drop file
    if(typeof(FormData) != 'undefined' && typeof(XMLHttpRequest) != 'undefined' && (droparea = document.getElementById('spud_admin_photo_upload_queue'))){
      html5upload = true;
      $('#spud_admin_photo_upload_queue').show();
      droparea.addEventListener('dragenter', self.stopDndPropagation, false);
      droparea.addEventListener('dragexit', self.stopDndPropagation, false);
      droparea.addEventListener('dragover', self.stopDndPropagation, false);
      droparea.addEventListener('drop', self.droppedFile, false);

      // prevent accidental drops outside the queue
      var body = document.getElementsByTagName("body")[0];
      body.addEventListener('dragenter', self.stopDndPropagation, false);
      body.addEventListener('dragexit', self.stopDndPropagation, false);
      body.addEventListener('dragover', self.stopDndPropagation, false);
      body.addEventListener('drop', self.stopDndPropagation, false);
    }
  };

  this.submittedPhotoAlbumForm = function(e){

  };

  this.submittedPhotoGalleryForm = function(e){
    $('#spud_admin_photo_albums_available .spud_admin_photo_ui_thumb').remove();
  };

  this.clickedPhotoRemoveFromAlbum = function(e){
    $(this).parents('.spud_admin_photo_ui_thumb').fadeOut(200, function(){
      $(this).remove();
    });
    return false;
  };

  /* Handle file uploads passed via iframe (legacy support)
  * -------------------------------------------------------- */

  this.photoLegacyUploadErrors = function(html){
    $('#spud_admin_photo_form').replaceWith(html);
  };

  this.photoLegacyUploadComplete = function(id, html){
    var element = $('#spud_admin_photo_' + id);
    if(element.length > 0){
      element.replaceWith(html);
    }
    else{
      var target = $('#spud_admin_photos_selected, #spud_admin_photos');
      target.prepend(html);
    }
    hideModalDialog();
  };

  this.selectedPhotoUiThumb = function(e){
    var thumb = $(this);
    if(thumb.hasClass('spud_admin_photo_ui_thumb_selected')){
      $(this).removeClass('spud_admin_photo_ui_thumb_selected');
    }
    else{
      $(this).addClass('spud_admin_photo_ui_thumb_selected');
    }
  };

  this.markPhotoAsDeleted = function(photo_id){
    var photo = $('#spud_admin_photo_' + photo_id);
    photo.fadeOut(200, function(){
      photo.remove();
    });
  };

  this.markPhotoAlbumAsDeleted = function(photo_album_id){
    var photo_album = $('#spud_admin_photo_album_' + photo_album_id);
    photo_album.fadeOut(200, function(){
      photo_album.remove();
    });
  };

  this.markPhotoGalleryAsDeleted = function(photo_gallery_id){
    var photo_gallery = $('#spud_admin_photo_gallery_' + photo_gallery_id);
    photo_gallery.fadeOut(200, function(){
      photo_gallery.remove();
    });
  };

  /*
  * Single-Photo Form Upload
  -------------------------------- */

  this.submittedPhotoForm = function(e){
    // disable submit button
    // not working in updated bootstrap!
    // var submit = $(this).find('input[type=submit]');
    // submit.attr('disabled', 'disabled').val(submit.attr('data-loading-text'));

    if(html5upload){
      // create a FormData object and attach form values
      var fd = new FormData();
      var form = $(this);
      fd.append('_method', form.find('[name=_method]').val());
      fd.append('authenticity_token', form.find('[name=authenticity_token]').val());
      fd.append('spud_photo[title]', form.find('#spud_photo_title').val());
      fd.append('spud_photo[caption]', form.find('#spud_photo_caption').val());

      // progress bar to send events to
      var progressBar;
      var file = form.find('#spud_photo_photo')[0].files[0];
      if(file){
        progressBar = self.progressBarForUpload(file.name);
        fd.append('spud_photo[photo]', file);
        form.append(progressBar);
      }
      else{
        progressBar = self.progressBarForUpload('');
      }

      // send FormData object as ajax request
      var xhr = new XMLHttpRequest();
      xhr.upload.addEventListener('progress', function(e){ self.onPhotoUploadProgress(e, progressBar); }, false);
      xhr.addEventListener('load', function(e){ self.onPhotoUploadComplete(e, progressBar); }, false);
      xhr.addEventListener('error', function(e){ self.onPhotoUploadFailure(e, progressBar); }, false);
      xhr.addEventListener('abort', function(e){ self.onPhotoUploadCancel(e, progressBar); }, false);
      xhr.open('POST', form.attr('action'));
      xhr.setRequestHeader('X-Requested-With', 'XMLHttpRequest');
      xhr.send(fd);
      return false;
    }
  };

  /*
  * Upload Progress Monitoring
  -------------------------------- */

  this.progressBarForUpload = function(fileName){
    var html = [
      '<div class="spud_admin_photo_progress">',
        '<h6>',
          '<span class="spud_admin_photo_progress_filename">'+fileName+'</span>: ',
          '<span class="spud_admin_photo_progress_status">Uploading</span>',
        '</h6>',
        '<div class="progress progress-striped active">',
          '<div class="bar" style="width: 0;"></div>',
        '</div>',
      '</div>'
    ].join('');
    return $(html);
  };

  this.onPhotoUploadProgress = function(e, progressBar){
    var percent = Math.round(e.loaded * 100 / e.total);
    progressBar.find('.bar').css({width: percent + '%'});
    if(percent == 100){
      progressBar.find('.progress').addClass('progress-success');
      progressBar.find('.spud_admin_photo_progress_status').text('Processing');
    }
  };

  this.onPhotoUploadComplete = function(e, progressBar){
    // success
    var photo = $.parseJSON(e.target.response);
    if(e.target.status == 200){
      progressBar.find('.spud_admin_photo_progress_status').text('Done!');
      progressBar.find('.progress').removeClass('progress-striped active');
      var element = $('#spud_admin_photo_' + photo.id);
      if(element.length > 0){
        element.replaceWith(photo.html);
      }
      else{
        var target = $('#spud_admin_photos_selected, #spud_admin_photos');
        target.prepend(photo.html).fadeIn(200);
      }
      hideModalDialog();
    }
    // validation error
    else{
      $("#modal_window .modal-body").html(photo.html);
    }
  };

  this.onPhotoUploadCancel = function(e, progressBar){
    progressBar.find('.spud_admin_photo_progress_status').text('Done!');
    progressBar.find('.progress').addClass('progress-danger');
  };

  /*
  * Photo Upload/Edit Form
  ------------------------------- */
  this.clickedPhotoAddOrEdit = function(e){
    var url = this.href;
    $.ajax({
      url:url,
      success:self.photoUploadFormLoaded
    });
    return false;
  };

  this.photoUploadFormLoaded = function(html){
    displayModalDialogWithOptions({
      title: 'Upload Photo',
      html: html
    });
  };

  /*
  * Add From Photo Library
  ------------------------------- */

  this.clickedPhotoLibrary = function(e){
    var url = this.href;
    $.ajax({
      url:url,
      success:self.photoLibraryLoaded
    });
    return false;
  };

  this.photoLibraryLoaded = function(html){
    var dialog = $('#modal_window');
    $('#spud_admin_photos_selected .spud_admin_photo_ui_thumb').each(function(){
      var id = $(this).attr('id');
      var dupe = dialog.find('#'+id);
      if(dupe){
        dupe.remove();
      }
    });
    displayModalDialogWithOptions({
      title: 'My Photo Library',
      html: html,
      buttons:{
        'spud_admin_photo_library_add_selected btn-primary': 'Add Selected',
        'spud_admin_photo_library_delete_selected btn-danger': 'Delete Selected'
      }
    });
  };

  this.addSelectedPhotosFromLibrary = function(e){
    $('#spud_admin_photo_library .spud_admin_photo_ui_thumb_selected')
      .removeClass('spud_admin_photo_ui_thumb_selected')
      .prependTo('#spud_admin_photos_selected')
      .hide()
      .fadeIn(200);
    hideModalDialog();
  };

  this.deleteSelectedPhotosFromLibrary = function(e){
    var ids = $.map($('.spud_admin_photo_ui_thumb_selected'), function(val, i){
      return $(val).attr('rel');
    });
    $.ajax({
      type: 'POST',
      url: '/spud/admin/photos/mass_destroy',
      data: {spud_photo_ids:ids},
      success: function(data, textStatus, jqXHR){
        $('.spud_admin_photo_ui_thumb_selected').fadeOut(200, function(){
          $(this).remove();
        });
      },
      error: function(jqXHR, textStatus, errorThrown){
        console.log('An error occurred:');
        console.log(arguments);
      }
    });

  };

  /*
  * Drag & Drop File Upload Queue
  -------------------------------- */

  this.fileQueue = [];
  this.fileQueueStarted = false;

  // prevent default browser behavior of opening the dropped file
  this.stopDndPropagation = function(e){
    e.stopPropagation();
    e.preventDefault();
  };

  // add files to queue. starts queue if not started already
  this.droppedFile = function(e){
    e.stopPropagation();
    e.preventDefault();
    $('#spud_admin_photo_upload_queue').show();
    var files = e.dataTransfer.files;
    var i = 0;
    while(i < files.length){
      self.fileQueue.push(files[i]);
      i++;
    }
    self.updateQueueCountLabel();
    if(!this.fileQueueStarted){
      self.uploadNextPhoto();
      if(self.fileQueue.length > 0){
        self.uploadNextPhoto();
      }
    }
  };

  this.updateQueueCountLabel = function(){
    $('#spud_admin_photo_upload_queue_label span').text(self.fileQueue.length);
  };

  this.uploadNextPhoto = function(){
    if(self.fileQueue.length === 0){
      self.fileQueueStarted = false;
      return;
    }

    // formdata object
    self.fileQueueStarted = true;
    var file = self.fileQueue.pop();
    var fd = new FormData();
    fd.append('spud_photo[photo]', file);

    // create a progress bar
    var progressBar = self.progressBarForUpload(file.name);
    $('#spud_admin_photo_upload_queue_bars').prepend(progressBar);

    // send formdata as xhr
    var xhr = new XMLHttpRequest();
    xhr.upload.addEventListener('progress', function(e){ self.onPhotoUploadProgress(e, progressBar); }, false);
    xhr.addEventListener('load', function(e){ self.onQueuedPhotoUploadComplete(e, progressBar); }, false);
    xhr.addEventListener('error', function(e){ self.onPhotoUploadFailure(e, progressBar); }, false);
    xhr.addEventListener('abort', function(e){ self.onPhotoUploadCancel(e, progressBar); }, false);
    xhr.open('POST', '/spud/admin/photos');
    xhr.setRequestHeader('X-Requested-With', 'XMLHttpRequest');
    xhr.send(fd);
  };

  this.onQueuedPhotoUploadComplete = function(e, progressBar){
    self.onPhotoUploadComplete(e, progressBar);
    self.updateQueueCountLabel();
    self.uploadNextPhoto();
  };
};
