/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

const sign_up_link = document.querySelector("#sign-up-link");
const sign_in_link = document.querySelector("#sign-in-link");
const container = document.querySelector(".container");

sign_up_link.addEventListener("click", () => {
    container.classList.add("sign-up-mode");
});

sign_in_link.addEventListener("click", () => {
    container.classList.remove("sign-up-mode");
})
