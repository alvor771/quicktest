<?php

class Loader
{
	protected $registry;
	public $modelPrefix = "Model";
	public $modelFolder = "model/";

	public function __construct($registry) {
		$this->registry = $registry;
	}

	public function __get($key) {
		return $this->registry->get($key);
	}

	public function __set($key, $value) {
		$this->registry->set($key, $value);
	}

	public function model($model) {
		$file  = DIR_APPLICATION . $this->modelFolder . $model . '.php';

		$modelInfo = explode('/', $model);

		$modelDir = $modelInfo[0];
		$modelName = $modelInfo[1];

		//$class = $this->modelPrefix . preg_replace('/[^a-zA-Z0-9]/', '', $model);
		$class = $this->modelPrefix . ucfirst($modelDir) . ucfirst($modelName);

		if (file_exists($file)) {
			include_once($file);
			$this->registry->set($class, new $class($this->registry));
		} else {
			trigger_error('Error: Could not load model ' . $model . '!');
			exit();
		}
	}

	public function config($config) {
		$this->config->load($config);
	}

	public function language($language) {
		return $this->language->load($language);
	}
}