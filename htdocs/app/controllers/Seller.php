<?php
namespace app\controllers;

class Seller extends \app\core\Controller{
	public function index(){
	
		if(isset($_POST['action'])){
			$seller = new \app\models\Seller();
			$seller = $seller->getSeller($_POST['username']);
			if(password_verify($_POST['password'],$seller->password_hash)){
				$_SESSION['Seller_id'] = $seller->Seller_id;
				$_SESSION['username'] = $seller->username;
				header('location:/Product/addProduct');
			}else{
				header('location:/Seller/index?error=Invalid credentials');
			}
		}else{
			$this->view('Seller/index');
		}

	}

	public function register(){
		if(isset($_POST['action'])){
			if($_POST['password'] == $_POST['password_conf']){
				$seller = new \app\models\Seller();
				$nameIsUsed = $seller->getSeller($_POST['username']);
				if(!$nameIsUsed){
					$seller->username = $_POST['username'];
					$seller->password_hash = password_hash($_POST['password'], PASSWORD_DEFAULT);
					$seller->fname = $_POST['fname'];
					$seller->lname = $_POST['lname'];
					$seller->insertSeller();
					header('location:/Seller/index?message=Registered successfully');
				}else{
					header('location:/Seller/register?error=Username is already taken');	
				}
			}else{
				header('location:/Seller/register?error=Passwords do not match');
			}
		}else{
			$this->view('Seller/register');
		}
	}

	public function home(){
		$product = new \app\models\Product();
        $products = $product->getBySeller($_SESSION['Seller_id']);

		$this->view('/Seller/home', $products);
	}

	public function logout(){
		session_destroy();
		header('location:/Seller/index?message=Logged out');
	}

}