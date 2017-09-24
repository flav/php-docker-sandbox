index.php
<?php

$dsn = 'mysql:host=mysql;dbname=' . getenv('MYSQL_DATABASE');
$username = getenv('MYSQL_USER');
$password = getenv('MYSQL_PASSWORD');
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
