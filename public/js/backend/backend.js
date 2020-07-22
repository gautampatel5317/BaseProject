/**
@author : Kamelsh Gupta<webworldgk@gmail.com>
@date :04th April 2020
@description : core Js for utility, Validation and ajax call
*/

var Backend = {
    Utility: {
        fileUpload: function(){
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
            });
        },
        pagination: function(){
            Backend.Utility.ajaxfetchData(1);
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
              Backend.Utility.ajaxfetchData(page);
          });
        },
        ajaxfetchData: function(page){
            let token = $('form').find('input[name="_token"]').val();
              $.ajax({
                url     : moduleConfig.ListingURL+'?page='+page,
                type    : "JSON" ,
                method  : "POST",
                data: {_token: token},
                success : function (data) {                    
                    jQuery(moduleConfig.ListingClass).html(data);
                },
                error : function (error) {

                }
              });
        },
        deleteRecord: function(deleteURL,deleteClass){
            $(document).on('click',deleteClass,function(e){
                  var delId = jQuery(this).attr('data');
                  var URL =  deleteURL+`${delId}`;
                  
                  Swal.fire({
                    title: 'Are you sure?',
                    text: "You won't be able to delete this!",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes, delete it!'
                  }).then((result) => {
                    if (result.value) {
                      window.location.href = URL;
                      Swal.fire(
                        'Deleted!',
                        'Record has been deleted successfully!.',
                        'success'
                      )
                    }
                });
                  e.preventDefault();
            });

        },
        searchRecord: function(){
             jQuery(document).on("keyup",".table_search_record",function(){
                 var searchText = jQuery(this).val();
                 let token = $('form').find('input[name="_token"]').val();
                  jQuery.ajax({
                    url : moduleConfig.SearchURL,
                    type : "JSON",
                    method : "POST",
                    data : {'search_text' : searchText,'_token':token},
                    success : function (data) {
                         jQuery(moduleConfig.ListingClass).html(data);
                    }
                  });
               });
        },
        getUrl: function(path) {
            // This condition are added to solve IE issue
            if (path === undefined) {
                return window.location.origin;
            }
            return window.location.origin + path;
        },
        isNumber: function(evt) {
            evt = (evt) ? evt : window.event;
            var charCode = (evt.which) ? evt.which : evt.keyCode;
            if (charCode > 31 && ((charCode < 48 || charCode > 57) && (charCode < 96 || charCode > 105))) {
                evt.preventDefault();
            }
        },
        onlyAlphaAndSpace: function(element){
             if (element) {
                    element.onkeypress = function(event) {
                        var charCode = (event.which) ? event.which : event.keyCode;
                        if (charCode > 31 && (charCode < 65 || charCode > 90) && (charCode < 97 || charCode > 122) && charCode != 32) {
                                event.preventDefault();
                        }
                };
             }
        },
        onlyAlpha: function(element){
             if (element) {
                    element.onkeypress = function(event) {
                        var charCode = (event.which) ? event.which : event.keyCode;
                        if (charCode > 31 && (charCode < 65 || charCode > 90) && (charCode < 97 || charCode > 122)) {
                                event.preventDefault();
                        }
                };
             }
        },
        onlyAlphaNumericSpace: function(element){
             if (element) {
                    element.onkeypress = function(event) {
                        var charCode = (event.which) ? event.which : event.keyCode;
                        if (charCode > 31 && (charCode < 65 || charCode > 90) && (charCode < 97 || charCode > 122)  && (charCode < 48 || charCode > 57) && charCode != 32) {
                                event.preventDefault();
                        }
                };
             }
        },
        onlyAlphaNumeric: function(element){
             if (element) {
                    element.onkeypress = function(event) {
                        var charCode = (event.which) ? event.which : event.keyCode;
                            if (charCode > 31 && (charCode < 65 || charCode > 90) && (charCode < 97 || charCode > 122)  && (charCode < 48 || charCode > 57)) {
                                event.preventDefault();
                        }
                };
             }
        },
        onlyNumeric: function(element){
             if (element) {
                    element.onkeypress = function(event) {
                        var charCode = (event.which) ? event.which : event.keyCode;
                        if (charCode < 48 || charCode > 57) {
                                event.preventDefault();
                        }
                };
             }
        },
        limitLength: function(element) {
            if (element) {
                var limit = element.attributes.limitLength.value;
                element.onkeypress = function(event) {
                    var charCode = (event.which) ? event.which : event.keyCode;
                    if (charCode > 31 && ((charCode >= 48 && charCode <= 57) || (charCode >= 65 && charCode <= 90) || (charCode >= 97 || charCode <= 122))) {
                        if (this.value.length >= limit) {
                            return false;
                        };
                    }
                };
            }
        },
        specialChars: function (element) {
            console.log(element);
        },
        generateRandomText: function(){
            var result = '';
            var chars = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
            var length = 32;

            for (var i = length; i > 0; --i) result += chars[Math.round(Math.random() * (chars.length - 1))];
            return result;
        },
        handleAjaxValidationErorrs: function(XMLHttpRequest, textStatus, errorThrown) {
            if (XMLHttpRequest.status == 422 || XMLHttpRequest.status == 423) {
                var errors = XMLHttpRequest.responseJSON.errors;
                var message = '';
                $.each(errors, function(key, value) {
                    message += value + '<br>';
                });
                var php_err = $('.container-custom .inner-header').next('.alert-info.alert');

                if(php_err.html() != undefined && php_err.html().length > 0) {
                    $(php_err).hide();
                }

                $('.alert').removeClass('hidden');
                $('.alert').html(message);
                window.scrollTo(0, 0);
                setTimeout(function() {
                    $('.alert').html('');
                    $('.alert').addClass('hidden');
                }, 7000);
            }
        },
        handleAjaxValidationErorrsModal: function(XMLHttpRequest, textStatus, errorThrown) {
            if (XMLHttpRequest.status == 422 || XMLHttpRequest.status == 423) {
                var errors = XMLHttpRequest.responseJSON;

                var message = '';

                $.each(errors.errors, function(key, value) {
                    message += value[0] + "<br>";
                });
                $('.modal-body .alert').removeClass('hidden');
                $('.modal-body .alert').html(message);
                window.scrollTo(0, 0);
                setTimeout(function() {
                    $('.modal-body .alert').html('');
                    $('.modal-body .alert').addClass('hidden');
                }, 7000);
            }
        },
        handleUserDefineSuccess: function(message) {
            $('.alert').addClass('black-font');
            $('.alert').removeClass('red-font');
            $('.alert').removeClass('hidden');
            $('.alert').html(message);
            window.scrollTo(0, 0);
            setTimeout(function() {
                $('.alert').html('');
                $('.alert').addClass('hidden');
                $('.alert').removeClass('black-font');
                $('.alert').addClass('red-font');
            }, 7000);
        },
        handleUserDefineSuccessModal: function(message) {
            $('.modal-body .alert').addClass('black-font');
            $('.modal-body .alert').removeClass('red-font');
            $('.modal-body .alert').addClass('alert-success');
            $('.modal-body .alert').removeClass('alert-danger');
            $('.modal-body .alert').removeClass('hidden');
            $('.modal-body .alert').html(message);
            window.scrollTo(0, 0);
            setTimeout(function() {
                $('.modal-body .alert').html('');
                $('.modal-body .alert').addClass('hidden');
                $('.modal-body .alert').removeClass('black-font');
                $('.modal-body .alert').addClass('red-font');
            }, 7000);
        },
        handleUserDefineErrorModal: function(message) {
            $('.modal-body .alert').removeClass('hidden');
            $('.modal-body .alert').html(message);
            window.scrollTo(0, 0);
            setTimeout(function() {
                $('.modal-body .alert').html('');
                $('.modal-body .alert').addClass('hidden');
            }, 7000);
        },
        handleUserDefineError: function(message) {
            var php_err = $('.container-custom .inner-header').next('.alert-info.alert');

            if(php_err.html() != undefined && php_err.html().length > 0) {
                $(php_err).hide();
            }
            $('.alert').removeClass('hidden');
            $('.alert').html(message);
            window.scrollTo(0, 0);
            setTimeout(function() {
                $('.alert').html('');
                $('.alert').addClass('hidden');
            }, 7000);
        },
    },
    Validate: {
        init: {
            errorClass: 'is-invalid',
            errorElement: 'span',
            errorPlacement: function (error, element) {
               error.addClass('invalid-feedback');
              element.closest('.form-group').append(error);
               var elem = $(element);
               if (elem.hasClass("select2-hidden-accessible")) {
                   element = $("#select2-" + elem.attr("id") + "-container").parent(); 
                   error.insertAfter(element);
               } else if(elem.hasClass("multiple_input")){
                   element = $("#" + elem.attr("id")); 
                   error.insertAfter(element);
               }else if (element.hasClass("file")) { 
                    //error.insertAfter(element.siblings(".note-editor")); 
                    element.closest('.form-group').append(error);
               }else if (element.hasClass("summernote")) { 
                    error.insertAfter(element.siblings(".note-editor")); 
               }else {
                   error.insertAfter(element);
               }
            },
            highlight: function (element, errorClass, validClass) {
               var elem = $(element);
               if (elem.hasClass("select2-hidden-accessible")) {
                   $("#select2-" + elem.attr("id") + "-container").parent().addClass(errorClass); 
               } else {
                   elem.addClass(errorClass);
               }
            },
            unhighlight: function (element, errorClass, validClass) {
                var elem = $(element);
                if (elem.hasClass("select2-hidden-accessible")) {
                    $("#select2-" + elem.attr("id") + "-container").parent().removeClass(errorClass);
                } else {
                    elem.removeClass(errorClass);
                }
            },
        },   
        Users: function(event) {
            var Rules = Backend.Validate.init;
            var $validator = $(".form-validate-jquery").validate({
            errorClass: Rules.errorClass,
            highlight: Rules.highlight,
            unhighlight: Rules.unhighlight,
            errorPlacement: Rules.errorPlacement,
            rules: {
                vali: "required",
                name: {
                    required: true                
                },
                email: {
                    required: true
                },
                password: {
                    required: true               
                },
                'roles[]' :"required"
            },
            messages: {
                name: 'The name field is required!',
                email: 'The email field is required!',
                password:'The password field is required!',            
                roles: 'The roles field is required!'
                
            }
        });
        Backend.Validate.$validator = $validator;
        },
        Roles: function(event) {
            var Rules = Backend.Validate.init;
            var $validator = $(".form-validate-jquery").validate({
            errorClass: Rules.errorClass,
            highlight: Rules.highlight,
            unhighlight: Rules.unhighlight,
            errorPlacement: Rules.errorPlacement,
            rules: {
                vali: "required",
                title: {
                    required: true                
                },           
            'permissions[]':"required"
            },
            messages: {
                title: 'The title field is required!',
                permissions: 'The permissions field is required!'
            }
        });
        Backend.Validate.$validator = $validator;
        },
        Customers: function(event) {
            var Rules = Backend.Validate.init;
            var $validator = $(".form-validate-jquery").validate({
            errorClass: Rules.errorClass,
            highlight: Rules.highlight,
            unhighlight: Rules.unhighlight,
            errorPlacement: Rules.errorPlacement,
            rules: {
                vali: "required",
                first_name: {
                    required: true
                },
                family_name: {
                    required: true
                },
                email: {
                    required: true,
                    email: true
                },
                experience: {
                    required: true
                },
                business: {
                    required: true
                },
            },
            messages: {
                first_name: 'The first name field is required.',
                family_name: 'The family name field is required.',
                email: 'The email field is required!',
                experience:'The experience field is required!',            
                business: 'The business field is required!'
            }
        });
        Backend.Validate.$validator = $validator;
        },
        Cms: function(event) {
            var Rules = Backend.Validate.init;
            var $validator = $(".form-validate-jquery").validate({
            errorClass: Rules.errorClass,
            highlight: Rules.highlight,
            unhighlight: Rules.unhighlight,
            errorPlacement: Rules.errorPlacement,
            rules: {
                vali: "required",
                title: {required: true},
                description: {required: true},
            },
            messages: {
                title: 'The title field is required.',
                description: 'The description field is required.',
            }
        });
        Backend.Validate.$validator = $validator;
        },
        Country: function(event) {
            var Rules = Backend.Validate.init;
            var $validator = $(".form-validate-jquery").validate({
                errorClass: Rules.errorClass,
                highlight: Rules.highlight,
                unhighlight: Rules.unhighlight,
                errorPlacement: Rules.errorPlacement,
                rules: {
                    vali: "required",
                    name: {required: true, lettersonly : true},
                    code: {required: true, lettersonly : true},
                    phonecode: {required: true, pattern : /^\+?[0-9]+$/},
                },
                messages: {
                    name: {
                        'required': 'The country name field is required!',
                        'lettersonly': 'The country name should be lettersonly!'
                    }, 
                    code:{
                        'required': 'The code code field is required!',
                        'lettersonly':'The code should be lettersonly!',
                    },
                    phonecode:{
                        'required':'The phonecode phone code field is required!',  
                        'pattern':'The phonecode allow only numbers! '
                    }, 
                }
            });
        Backend.Validate.$validator = $validator;
        },
        State: function(event) {
            var Rules = Backend.Validate.init;
            var $validator = $(".form-validate-jquery").validate({
                errorClass: Rules.errorClass,
                highlight: Rules.highlight,
                unhighlight: Rules.unhighlight,
                errorPlacement: Rules.errorPlacement,
                rules: {
                    vali: "required",
                    name: {required: true, lettersonly : true},
                    country_id: {required: true},
                },
                messages: {
                    name:{
                      'required':'The state name field is required!',  
                      'lettersonly':'The state name should be lettersonly!'
                    }, 
                    country_id: 'The country name field is required.',
                }
            });
        Backend.Validate.$validator = $validator;
        },
        City: function(event) {
            var Rules = Backend.Validate.init;
            var $validator = $(".form-validate-jquery").validate({
                errorClass: Rules.errorClass,
                highlight: Rules.highlight,
                unhighlight: Rules.unhighlight,
                errorPlacement: Rules.errorPlacement,
                rules: {
                    vali: "required",
                    name: {required: true, lettersonly : true},
                    country_id: {required: true},
                    state_id: {required: true},
                },
                messages: {
                    name:{
                        'required':'The city name field is required!',
                        'lettersonly':'The city name should be lettersonly!'
                    },
                    country_id: 'The country name field is required.',
                    state_id: 'The state name field is required.',
                }
            });
        Backend.Validate.$validator = $validator;
        },
        
        permissions: function(event) {
          var Rules = Backend.Validate.init;
          var $validator = $(".form-validate-jquery").validate({
            errorClass: Rules.errorClass,
            highlight: Rules.highlight,
            unhighlight: Rules.unhighlight,
            errorPlacement: Rules.errorPlacement,
            rules: {
              vali: "required",
              title: {
                  required: true                
                },                       
            },
            messages: {
                title: 'The title field is required!',
            }
          });
          Backend.Validate.$validator = $validator;
    },
    Profile: function(event) {
        var Rules = Backend.Validate.init;
        var $validator = $(".form-validate-jquery").validate({
        errorClass: Rules.errorClass,
        highlight: Rules.highlight,
        unhighlight: Rules.unhighlight,
        errorPlacement: Rules.errorPlacement,
        rules: {
            vali: "required",
            name: {
                required: true                
            },
            current_password: {
                required: true
            },
            new_password: {
                required: true               
            }
        },
        messages: {
            name: 'The name field is required!',
            current_password: 'The current password field is required!',
            new_password:'The new password field is required!'
        }
    });
    Backend.Validate.$validator = $validator;
    },
    Ingredient: function(event) {
        var Rules = Backend.Validate.init;
        var $validator = $(".form-validate-jquery").validate({
          errorClass: Rules.errorClass,
          highlight: Rules.highlight,
          unhighlight: Rules.unhighlight,
          errorPlacement: Rules.errorPlacement,
          rules: {
            vali: "required",
            title: {
                required: true                
              },                       
          },
          messages: {
              title: 'The title field is required!',
          }
        });
        Backend.Validate.$validator = $validator;
  },
  SubscriptionName: function(event) {
    var Rules = Backend.Validate.init;
    var $validator = $(".form-validate-jquery").validate({
      errorClass: Rules.errorClass,
      highlight: Rules.highlight,
      unhighlight: Rules.unhighlight,
      errorPlacement: Rules.errorPlacement,
      rules: {
        vali: "required",
        name: {
            required: true                
          },                       
      },
      messages: {
          name: 'The name field is required!',
      }
    });
    Backend.Validate.$validator = $validator;
},
SubscriptionType: function(event) {
    var Rules = Backend.Validate.init;
    var $validator = $(".form-validate-jquery").validate({
      errorClass: Rules.errorClass,
      highlight: Rules.highlight,
      unhighlight: Rules.unhighlight,
      errorPlacement: Rules.errorPlacement,
      rules: {
        vali: "required",
        type: {
            required: true                
          },                       
      },
      messages: {
          type: 'The Type field is required!',
      }
    });
    Backend.Validate.$validator = $validator;
},
    Experience: function(event) {
        var Rules = Backend.Validate.init;
        var $validator = $(".form-validate-jquery").validate({
            errorClass: Rules.errorClass,
            highlight: Rules.highlight,
            unhighlight: Rules.unhighlight,
            errorPlacement: Rules.errorPlacement,
            rules: {
                vali: "required",
                name: {
                    required: true                
                },                       
            },
            messages: {
                name: 'The name field is required!',
            }
        });
        Backend.Validate.$validator = $validator;
    },
    Settings: function(event) {
        var Rules = Backend.Validate.init;
        var $validator = $(".form-validate-jquery").validate({
            errorClass: Rules.errorClass,
            highlight: Rules.highlight,
            unhighlight: Rules.unhighlight,
            errorPlacement: Rules.errorPlacement,
            rules: {
                vali: "required",
                logo: {extension: "jpg|jpeg|png|gif|JPG|JPEG|PNG|GIF"},
                favicon: {extension: "jpg|jpeg|png|gif|ico|JPG|JPEG|PNG|GIF|ICO"},
            },
            messages: {
                logo:{'extension':'Only gif, jpg, jpeg, png are allowed.'}, 
                favicon:{'extension':'Only gif, jpg, jpeg, png, ico are allowed.'}, 
            }
        });
    Backend.Validate.$validator = $validator;
    },
    Interest: function(event) {
        var Rules = Backend.Validate.init;
        var $validator = $(".form-validate-jquery").validate({
            errorClass: Rules.errorClass,
            highlight: Rules.highlight,
            unhighlight: Rules.unhighlight,
            errorPlacement: Rules.errorPlacement,
            rules: {
                vali: "required",
                name: {
                    required: true                
                },                       
            },
            messages: {
                name: 'The Interest field is required!',
            }
        });
        Backend.Validate.$validator = $validator;
    },
  }
}