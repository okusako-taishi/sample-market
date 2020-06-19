// $(function(){
//   var index = [0,1,2,3,4,5,6,7,8,9];
//   $(".flexbox").on("click", ".delete-btn", function(){
//     var targetIndex = Number($(this).attr("index"));
//     index.push(targetIndex);
//     if($(this).parent().parent().attr("class") == "item-main__box__preview-first"){
//       $(".item-main__box__preview .item-main__box__preview__image:first").appendTo(".item-main__box__preview-first");
//     }
//     if(index.length > 6){
//       $(".item-main__box__image-field").css("width",(index.length-5)*132);
//     }else if(index.length == 6){
//       $("#image-field-second").remove();
//       $(".item-main__box__preview").remove();
//       $(".item-main__box__preview-first").attr("class", "item-main__box__preview");
//       $(".item-main__box__image-field").css("display","flex");
//     }else if(index.length == 1){
//       $("#image-field-second").css("display","flex");
//       $("#image-field-second").css("width",index.length*132);
//     }else{
//       $("#image-field-second").css("width",index.length*132);
//     }
//     $("#image-wrapper").attr("for",`item_images_attributes_${targetIndex}_image`);
//     $(this).parent().remove();
//     $(`#item_images_attributes_${targetIndex}_image`).remove();
//     $(".flexbox").append(`<input class="file-field" type="file" name="item[images_attributes][${targetIndex}][image]" id="item_images_attributes_${targetIndex}_image">`);

//   })
//   var buildImage = function(url){
//     if(index.length != 0){
//       $(".item-main__box__preview").append(`
//         <div class=".item-main__box__preview__image">
//         <img class=".item-main__box__preview__image__img" src="${url}" width="100px" height="100px">
//         <div class="delete-btn" index=${index[0]}><i class="far fa-times-circle"></i></div>
//       `);
//       $(".flexbox").append(`<input class="file-field" type="file" name="product[images_attributes][${index[1]}][image]" id="product_images_attributes_${index[1]}_image">`);
//       $("#image-wrapper").attr("for",`product_images_attributes_${index[1]}_image`);
//       index.shift();
//       if(index.length > 5){
//         $("#image-field-second").remove();
//         $(".item-main__box__image-field").css("display","flex");
//         $(".item-main__box__image-field").css("width",(index.length-5)*132);
//       }else if(index.length ==5){
//         $(".item-main__box__image-field").css("display","none");
//         $("#image-wrapper").append(`
//           <div class=".item-main__box__image-field" id="image-field-second">
//             <i class="fas fa-camera"></i>
//             <div class=".item-main__box__image-field__text">
//               ドラッグアンドドロップ
//               <br>
//               またはクリックしてファイルをアップロード
//             </div>
//           </div>
//         `);
//         $(".item-main__box__preview").attr("class", ".item-main__box__preview-first");
//         $(".item-main__box__preview-first").after(`<div class=".item-main__box__preview"></div>`);
//       }else if(index.length == 0){
//         $("#image-field-second").css("display","none");
//       }
//       $("#image-field-second").css("width",index.length*132);
//     }
//   }
//   $(".flexbox").on("change", function(e){
//     var blob = window.URL.createObjectURL(e.target.files[0]);
//     buildImage(blob);
//   })
// })
