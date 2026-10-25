const products = [
    {id: 1, name: "Banana", description: "Fresh organic bananas // approx $0.33 ea", price: 0.99 }, 
    {id: 2, name: "Apple", description: "Fresh organic gala apples // approx $0.50 ea", price: 2.99 }, 
    {id: 3, name: "Brocoli", description: "brocoli, fresh // approx $0.75 ea", price: 1.99 }, 

];

const productList = document.getElementById("product-grid");

function showProduct(product) {
    const card = document.createElement("div");
    card.className = "product-card";

    card.innerHTML = 
      "<h3>" + product.name + "</h3>" + 
      "<p>" + product.description + "</p>" + 
      "<p>$" + product.price.toFixed(2) + "</p>";

    productList.appendChild(card);
}

products.forEach(showProduct);
