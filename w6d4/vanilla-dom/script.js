document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });



  // adding SF places as list items

  // --- your code here!

  const addPlace = (e) => {
    e.preventDefault();
    let placeInput = document.getElementsByClassName('favorite-input')[0];
    let placeList = document.getElementById('sf-places');
    let newPlace = document.createElement('li');
    newPlace.textContent = placeInput.value;
    placeInput.value = "";
    placeList.appendChild(newPlace);
  };

  const placeButton = document.getElementsByClassName('favorite-submit')[0];
  placeButton.addEventListener("click", addPlace);


  // adding new photos

  // --- your code here!

  const showForm = (e) => {
    e.preventDefault();
    let photoForm = document.getElementsByClassName('photo-form-container')[0];
    photoForm.classList.toggle('hidden');
  };

  const showButton = document.getElementsByClassName('photo-show-button')[0];
  showButton.addEventListener("click", showForm);

  const addImage = (e) => {
    e.preventDefault();
    let photoList = document.getElementsByClassName('dog-photos')[0];
    let li = document.createElement('li');
    let img = document.createElement('img');
    let urlInput = document.getElementsByClassName('photo-url-input')[0];
    img.src = urlInput.value;
    li.appendChild(img);
    photoList.appendChild(li);
  };

  const imageButton = document.getElementsByClassName('photo-url-submit')[0];
  imageButton.addEventListener("click", addImage)
});
