<?php

/**
 * Created by PhpStorm.
 * User: alvor
 * Date: 20.02.17
 * Time: 12:03
 */
class ControllerAppSign extends Controller
{
    public function index()
    {
		$this->template = 'default/common/home.tpl';

//		$this->rp->setOutput($this->render());

		//$this->in();

    }

    public function in()
    {
    	$this->document->setTitle('My title');
		$this->load->model('app/sign');

		$auth_user_data = array(
			'email' => $this->rq->post['u_email'],
			'password' => $this->rq->post['u_password'],
		);

		$user = $this->ModelAppSign->getUser($auth_user_data['email'], $auth_user_data['password']);

		if (!$user) {
			return false;
		} else {
			$this->session->setSession('user_auth', $user);
		}

		header('Location: /');

    }

    public function up()
    {
    	$this->document->setTitle('Sign Up');

		$this->children = array(
			'common/header',
			'common/footer',
		);

    	$this->template = 'default/common/signup.tpl';


		$this->rp->setOutput($this->render());

//		$this->response->setOutput($this->render());
//		$this->response->setOutput($this->render());
    }

    public function out()
    {
    	$this->session->sessionDestroy('user_auth');
    }

}