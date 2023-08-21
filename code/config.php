﻿<?php
/**
 * Configuration file.
 * All settings must be there.
 */

// Данные входа в БД
define('DB_SERV', 'db');
define('DB_NAME', '3wifi');
define('DB_USER', '3wifi');
define('DB_PASS', '123456');

// Settings block
define('TRY_USE_MEMORY_TABLES', true);
define('DEBUG_SQLQUERY', false);
define('DEBUG_FILENAME', 'Debug.log');
define('MEMORY_TABLES_RELEVANCE_EXPIRES', 60*60*6); // 6 hours

// Tables
define('BASE_TABLE', 'base');
define('GEO_TABLE', 'geo');
define('BASE_TABLE_CONST', BASE_TABLE);
define('GEO_TABLE_CONST', GEO_TABLE);
define('BASE_MEM_TABLE', 'mem_base');
define('GEO_MEM_TABLE', 'mem_geo');
define('STATS_TABLE', 'stats');

// Stats
define('CACHE_STATS', true);
define('TOP_PORT', 30);
define('TOP_AUTH', 100);
define('TOP_NAME', 30);
define('TOP_BSSID', 30);
define('TOP_ESSID', 30);
define('TOP_SECURITY', 30);
define('TOP_WIFI_KEY', 100);
define('TOP_WPS_PIN', 30);
define('TOP_DNS', 30);
define('TOP_SSID', 10);

// Maps
define('MAX_ZOOM_LEVEL', 23);
define('MAX_YANDEX_ZOOM', 18);

define('DEFAULT_LAT', 55.76);
define('DEFAULT_LON', 37.64);
define('DEFAULT_RAD', 2);

define('YMAPS_APIKEY', '');
define('YLOCATOR_APIKEY', '');

// Users
define('LOGIN_MIN', 5);
define('LOGIN_MAX', 30);
define('NICK_MIN', 5);
define('NICK_MAX', 30);
define('PASS_MIN', 6);
define('PASS_MAX', 100);
define('FAV_MAX', 200);
define('LOC_MAX', 100);
define('INVITE_LEN', 12);
define('SESSION_TIMEOUT', 8*60);
define('GUEST_TIMEOUT', 60*60);
define('GUEST_WAIT', 10);
define('INVITE_VALID_FROM_BANNED', false);
define('ALLOW_BANNED_INVITE_REG', false);
define('BAN_REASONS', 'guest|parsing|commerce|public|inherit|weak|left|contact');

// Daemons
define('GEO_PORTION', 100);
define('USER_TIMEOUT', 24*60*60);
