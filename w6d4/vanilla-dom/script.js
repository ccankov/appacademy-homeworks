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
    const placeInput = document.getElementsByClassName('favorite-input')[0];
    const placeList = document.getElementById('sf-places');
    const newPlace = document.createElement('li');
    newPlace.textContent = placeInput.value;
    placeInput.value = "";
    placeList.appendChild(newPlace);
  };

  const placeButton = document.getElementsByClassName('favorite-submit')[0];
  placeButton.addEventListener("click", addPlace);


  // adding new photos

  // --- your code here!



});
