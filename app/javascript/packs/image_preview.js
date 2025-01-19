document.getElementById('image-upload').onchange = function(e) {
  var file = e.target.files[0];
  var reader = new FileReader();

  reader.onload = function(event) {
    var img = document.createElement('img');
    img.src = event.target.result;
    document.getElementById('image-preview').innerHTML = '';
    document.getElementById('image-preview').appendChild(img);
  };

  reader.readAsDataURL(file);
};