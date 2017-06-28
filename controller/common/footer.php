<?php

class ControllerCommonFooter extends Controller
{
	protected function index() {
		$this->template = 'default/common/footer.tpl';

		$this->render();
	}
}