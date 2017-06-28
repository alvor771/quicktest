<?php

class ControllerErrorError extends Controller
{
	public function index() {
		//die('dasdas');
        header("HTTP/1.0 404 Page not found");
		echo "Error! <b>PAGE Not found</b>";
	}

	public function error404() {
        header("HTTP/1.0 404 Page not found");
        $this->template = 'default/error/error404.tpl';
        $this->rp->setOutput($this->render());
        //echo "Er ror 404! <b>PAGE Not found</b>";
    }
}