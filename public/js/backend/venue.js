    $(document).ready(function () {
        Backend.Validate.Venue();

          /* Ajax for data load */
          fetchData(1);
          jQuery(".venue-name").on('keyup',function(e){
               e.preventDefault();
               var str =jQuery(this).val();
              if(/^[a-zA-Z0-9-]*$/.test(str) == false) {
                document.querySelector('.venue-name').value=str.slice(0,-1);
                 toastr.error('Space & Special character not allowed here!');
                }
          });
          $(document).on("click",".page-link",function(event){
            event.preventDefault();
              var pages = $(this).text();              
              var page = '';
              if (pages == '›') {                
                page = $(this).attr('href').split('page=')[1];
              } else if (pages == '<') {
                page = $(this).attr('href').split('page=')[1];
              } else {
                page = $(this).text();
              }
              fetchData(page);
          });
          function fetchData(page) {
             const url = window.origin+'/admin/venues/data?page='+page;          
             let token = $('form').find('input[name="_token"]').val();
              $.ajax({
                url     : url,
                type    : "JSON" ,
                method  : "POST",
                data: {_token: token},
                success : function (data) {                    
                    jQuery(".venues-data").html(data);
                },
                error : function (error) {

                }
              });
          }
          /* End Ajax for data load */
          jQuery(document).on("click", ".browse", function() {
            var file =jQuery(this).parents().find(".file");
            file.trigger("click");
          });
      jQuery('input[type="file"]').change(function(e) {
          var fileName = e.target.files[0].name;
          jQuery("#file").val(fileName);
          var reader = new FileReader();
          reader.onload = function(e) {
            // get loaded data and render thumbnail.
            document.getElementById("preview").src = e.target.result;
          };
          // read the image file as a data URL.
          reader.readAsDataURL(this.files[0]);
          jQuery("#image-error").hide();
      });
       jQuery(document).on("click",".delete-venues",function(){            
            Swal.fire({
                title: 'Are you sure?',
                text: "You won't be able to revert this!",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, delete it!'
            }).then((result) => {
                if (result.value) {
                    var url = window.origin;
                    url =  `${url}/admin/venues/delete/${jQuery(this).attr('data')}`;
                    window.location.href = url;
                    return false;
                    Swal.fire(
                        'Deleted!',
                        'Your file has been deleted.',
                        'success'
                    )
                }
            })
        });
       jQuery(document).on("keyup","#venue_search",function(){
         var searchText = jQuery(this).val();
         const url = window.origin+'/admin/venues/search';
         let token = $('form').find('input[name="_token"]').val();
          jQuery.ajax({
            url : url,
            type : "JSON",
            method : "POST",
            data : {'search_text' : searchText,'_token':token},
            success : function (data) {
                 jQuery(".venues-data").html(data);
            }
          });
       });
    });