<?php

class Database
{

    protected static $db;

    private function __construct()
    {
    }

    public static function begin()
    {

        if (self::$db === null) {
            self::$db = new MySQLHELPER();
        }

        return self::$db;

    }

    private function __clone()
    {
    }

}

class MySQLHELPER
{

    public $error;
    protected $db;
    protected $sql;
    private $query;
    private $lastQuery;
    private $lastResult = array();
    private $charset = 'UTF8';

    public function __construct()
    {
        $this->db = new mysqli(DB_HOST, DB_USER, DB_PSWD, DB_NAME);

        if ($this->db->connect_error) {
            exit($this->db->connect_error);
        }
        $this->db->query('SET NAMES ' . $this->charset);

    }

    public function query($sql)
    {

        $this->query = $sql;
        $this->lastQuery = $this->db->query($sql);
        unset($this->query);

        return $this;
    }

    public function assoc($exec = true)
    {
        $this->lastResult = array();
        $this->lastQuery = $this->db->query($this->query);

        if (!$this->lastQuery) {
//            $this->set_e('code', $this->db->errno);
//            $this->set_e('message', $this->db->error);
            return false;
        }

        if ($exec == true) {
            while ($row = $this->lastQuery->fetch_object()) {
                $this->lastResult[] = $row;
            }
            return $this->lastResult;
        }

        $this->sql = "";
        $this->query = "";

        return $this->lastQuery;

    }

    public function display()
    {
        foreach ($this->lastResult as $key) {
            foreach ($key as $name => $val) {
                echo $name . " " . $val . " | ";
            }
            echo "<br>";
        }
    }

    public function select($param)
    {
        $this->query = "";
        $this->query .= "SELECT $param ";
        return $this;
    }

    public function insert($table)
    {
        $this->query = "";
        $this->query .= "INSERT INTO `$table` ";
        return $this;
    }

    public function values($values = array())
    {
        $fields = "";
        $fields_values = "";
        $fields_count = count($values) - 1;
        $current_field = 0;

        foreach ($values as $field => $value) {
            if ($current_field != $fields_count) {
                $fields .= "`$field`, ";
                $fields_values .= "'$value', ";
            } else {
                $fields .= "`$field`";
                $fields_values .= "'$value'";
            }
            $current_field++;
        }

        $this->query .= "($fields) VALUES ($fields_values)";
        return $this;

    }

    public function update($table)
    {
        $this->query = "";
        $this->query .= "UPDATE `$table` SET ";
        return $this;
    }

    public function set($values = array())
    {
        $fields = "";
        $fields_count = count($values) - 1;
        $current_field = 0;

        foreach ($values as $field => $value) {
            if ($current_field != $fields_count) {
                $fields .= "`$field` = '$value', ";
            } else {
                $fields .= "`$field` = '$value'";
            }
            $current_field++;
        }

        $this->query .= $fields . " ";
        return $this;
    }

    public function from($table)
    {
        $this->query .= "FROM $table ";
        return $this;
    }

    public function delete($table)
    {
        $this->query .= "DELETE FROM `$table` ";
        return $this;
    }

    public function leftJoin($table, $condition)
    {
        $this->query .= "LEFT JOIN $table ON ($condition) ";
        return $this;
    }

    public function innerJoin($table, $condition)
    {
        $this->query .= "INNER JOIN $table ON ($condition) ";
        return $this;
    }

    public function rightJoin($table, $condition)
    {
        $this->query .= "RIGHT JOIN `$table` ON ($condition) ";
        return $this;
    }

    public function where($condition)
    {
        $this->query .= "WHERE ($condition) ";
        return $this;
    }

    public function order($field, $condition = 'ASC')
    {
        $this->query .= "ORDER BY $field $condition ";
        return $this;
    }

    public function group($field)
    {
        $this->query .= "GROUP BY $field ";
        return $this;
    }

    public function limit($limit = 1, $limit_end = null)
    {
        $this->query .= "LIMIT $limit " . (!is_null($limit_end) ? ', ' . $limit_end : '');
        return $this;
    }

    public function exec()
    {
        $this->db->query($this->query);
        if (!$this->lastQuery) {
//            $this->set_e('code', $this->db->errno);
//            $this->set_e('message', $this->db->error);
            return false;
        }
        return true;
    }

    public function debug()
    {
        echo "<pre>" . $this->query . "</pre>";
    }

    public function __destruct()
    {
        $this->db->close();
    }
}
