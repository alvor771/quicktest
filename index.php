<?php
session_start();

	// Configuration
	if (file_exists('config.php')) {
		require_once('config.php');
	}

	// Install
	if (!defined('DIR_APPLICATION')) {
		define('DIR_APPLICATION', '');
		//header('Location: install/index.php');
		//exit;
	}


	/***************************************************************************/

	include "includes/startup.php";

	$registry = new Registry;

	$db = Database::begin();
	$registry->set('db', $db);

	// Loader
	$loader = new Loader($registry);
	$registry->set('load', $loader);

	// Config
	$config = new Config();
	$registry->set('config', $config);

	// Session
	$session = new Session();
	$registry->set('session', $session);

	// Request
	$request = new Request();
	$registry->set('rq', $request);

	// Response
	$response = new Response();
	$response->addHeader('Content-Type: text/html; charset=utf-8');
	$registry->set('rp', $response);

	// Document
	$registry->set('document', new Document());

	// Front Controller
	$controller = new Front($registry);


	// Router
	if (isset($request->get['route'])) {
		$action = new Router($request->get['route']);
	} else {
		$action = new Router('index');
	}

	// Dispatch
	$controller->dispatch($action, new Router('error/error/error404'));

	// Output
	$response->output();