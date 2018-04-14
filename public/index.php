index.php
<?php

$dsn = 'mysql:host=db;dbname=' . getenv('DB_DATABASE');
$username = getenv('DB_USERNAME');
$password = getenv('DB_PASSWORD');
$options = array(
    //PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8',
);

$dbh = new PDO($dsn, $username, $password, $options);

echo '<pre>';
foreach($dbh->query('SELECT * from FOO') as $row) {
    print_r($row);
}
echo '</pre>';

phpinfo();
