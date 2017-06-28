<?php

class ControllerCommonHome extends Controller
{
	public function index() {

		$this->load->model('common/home');

		$this->document->setTitle('Quicktest');

		$this->data['list'] = $this->ModelCommonHome->test();

		$this->template = 'default/common/home.tpl';

		$this->response->setOutput($this->render());

	}
}