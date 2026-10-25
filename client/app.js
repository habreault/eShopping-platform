// app.js
// Builds the product cards and displays them on the page.

const products = [
  { id: 1, name: "Broccoli", price: 1.99, featured: true,  image: "images/broccoli.jpg" },
  { id: 2, name: "Apples",   price: 2.99, featured: true,  image: "images/apples.jpg" },
  { id: 3, name: "Bananas",  price: 0.99, featured: false, image: "images/banana.jpg" },
  { id: 4, name: "Oranges",  price: 3.49, featured: true,  image: "images/oranges.jpg" },
  { id: 5, name: "Kiwi",     price: 3.99, featured: false, image: "images/kiwi.jpg" },
  { id: 6, name: "Tomatoes", price: 2.49, featured: false, image: "images/tomato.jpg" },
];

const productList = document.getElementById("product-grid");

function showProduct(product) {
  const card = document.createElement("div");
  card.className = "product-card";

  // the products that are marked are featured with a badge
  const badge = product.featured ? '<span class="badge">Featured</span>' : "";


  // Here is for the product card, with the image, name, rating, price and buttons
  card.innerHTML =
    '<div class="card-image">' +
      '<img src="' + product.image + '" alt="' + product.name + '">' +
      '<button class="like-button" type="button" aria-label="Like">♡</button>' +
      badge +
    "</div>" +
    '<p class="product-name">' + product.name + "</p>" +
    '<div class="card-bottom">' +
      '<span class="product-price">$' + product.price.toFixed(2) + "</span>" +
      '<button class="add-button" type="button">Add to Cart</button>' +
    "</div>";

  // Here is for the heart button, to like/unlike product
  const likeButton = card.querySelector(".like-button");
  likeButton.addEventListener("click", function () {
    likeButton.classList.toggle("liked");
    likeButton.textContent = likeButton.classList.contains("liked") ? "♥" : "♡";
  });

  productList.appendChild(card);
}

products.forEach(showProduct);