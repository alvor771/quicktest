<?php

class ModelAppSign extends Model
{
	/**
	 * @function getUser
	 * @param $email
	 * @param $pass
	 * @return mixed
	 */
    public function getUser($email, $pass) {
        return $this->sql->select("*")
			->from('users')
			->where("email = '$email' AND password = MD5('$pass')")
			->assoc();
    }

	/**
	 * @function addUser
	 * @param array $user_data
	 * @return mixed
	 */
    public function addUser(Array $user_data) {
    	return $this->sql->insert('users')
			->set()
			->values()
			->exec();
	}
}