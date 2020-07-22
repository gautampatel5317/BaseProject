jQuery(document).ready(function() {   
    Backend.Validate.Company();
    jQuery(".domain").on('keyup',function(e){
      e.preventDefault();
      var regex = new RegExp("^[a-zA-Z_.0-9]+$");
      var key = jQuery(this).val();
      if (!regex.test(key)) {
            document.querySelector('.domain').value=key.slice(0,-1);
            toastr.error('Special character not allowed here!');
            return false;
        } 
    });
    jQuery('#sub_domain').on('keyup',function(e) {
      var str =jQuery(this).val();
      if(/^[a-zA-Z0-9- ]*$/.test(str) == false) {   
        document.querySelector('#sub_domain').value=str.slice(0,-1);
        toastr.error('Special character not allowed here!');
        return false;
    }
      if (str.indexOf('.') != -1) {
          jQuery(this).val('');
          toastr.error('Subdomain .com is not allowed!');
          return false;
      }
          return true;
    });
   jQuery(document).on("click", ".browse", function() {
      var file =jQuery(this).parents().find(".file");
      file.trigger("click");
       $("#logo-error").remove();
    });
   jQuery('input[type="file"]').change(function(e) {
      $("#logo-error").remove();
      var fileName = e.target.files[0].name;
      jQuery("#file").val(fileName);    
      var reader = new FileReader();
      reader.onload = function(e) {
        // get loaded data and render thumbnail.
        document.getElementById("preview").src = e.target.result;
      };
      // read the image file as a data URL.
      reader.readAsDataURL(this.files[0]);
    });   
  });
