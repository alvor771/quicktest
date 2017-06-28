<?php

class Session
{

	public function setSession($s_name, $s_value)
	{
		$_SESSION[$s_name] = $s_value;
	}

	public function getSession($s_name)
	{
		return isset($_SESSION[$s_name]) ? $_SESSION[$s_name] : false;
	}

	public function sessionDestroy($s_name)
	{
		unset($_SESSION[$s_name]);
	}

	public function setCookie($c_name, $c_value, $c_time = false)
	{
		if (!$c_time) {
			// set cookie expire to 1 day
			setcookie($c_name, $c_value, 60 * 60 * 24);
		} elseif ($c_time === Time) {
			// set cookie user expire time
			setcookie($c_name, $c_value, $c_time);
		}
	}

	public function getCookie($c_name) {
		return isset($_COOKIE[$c_name]) ? $_COOKIE[$c_name] : false;
	}

	public function cookieDestroy($c_name)
	{
		unset($_COOKIE[$c_name]);
	}

	public function destroyAll() {
		unset($_COOKIE);
		unset($_SESSION);
		session_destroy();
	}

}