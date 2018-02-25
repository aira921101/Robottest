*** Settings ***
Resource  ../Resources/PO/HomePage.robot
Resource  ../Resources/PO/TopNavBar.robot
Resource  ../Resources/PO/SearchResultsPage.robot
Resource  ../Resources/PO/CartPage.robot
Resource  ../Resources/PO/ProductPage.robot
Resource  ../Resources/PO/SignInPage.robot
*** Variables ***

*** Keywords ***
Search for Products
    HomePage.Load
    HomePage.Verify Page Loaded
    TopNavBar.Search Product
    SearchResultsPage.Verify Search Completed

Select Product from Search Results
    SearchResultsPage.Click Product Link
    ProductPage.Verify Page Loaded

Add Product to Cart
    ProductPage.Add Product to Cart
    CartPage.Verify Product Added

Begin Checkout
    CartPage.Proceed to Checkout
    SignInPage.Verify Page Loaded