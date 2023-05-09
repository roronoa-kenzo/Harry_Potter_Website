slyterin.addEventListener("mouseover", function( event ) {
    // on met l'accent sur la cible de mouseover
    event.target.style.backgroundColor = "orange";
  
    // on réinitialise la couleur après quelques instants
    setTimeout(function() {
      event.target.style.backgroundColor = "";
    }, 500);
  }, false);