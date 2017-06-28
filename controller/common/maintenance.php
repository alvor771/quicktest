<?php

/**
 * Created by PhpStorm.
 * User: voron
 * Date: 20.12.2016
 * Time: 0:45
 */
class ControllerCommonMaintenance extends Controller
{
	public function index() {
		$this->template = 'default/common/maintanance.tpl';
		$this->response->setOutput($this->render());
//		echo 'hello world -------------------------';
	}
}