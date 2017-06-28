<?php

class ControllerCommonHeader extends Controller
{
	protected function index() {

		$this->data['title'] = $this->document->getTitle();

		$this->data['user'] = $this->session->getSession('user_auth');

		$this->template = 'default/common/header.tpl';


		$ip_address = "109.173.159.89";

		$e =geoip_continent_code_by_name($ip_address);


		$ip_country = geoip_record_by_name($ip_address);

		$this->render();
	}
}