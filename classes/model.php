<?php

abstract class Model
{
	protected $sql = null;
	protected $registry;

	public function __construct($registry)
	{
		$this->registry = $registry;
		$this->sql = $this->db;
	}

	public function __get($key)
	{
		return $this->registry->get($key);
	}

	public function __set($key, $value)
	{
		$this->registry->set($key, $value);
	}
}