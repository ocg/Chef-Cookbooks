# @(#) $Id: mysql.schema,v 1.7 2008/10/20 18:30:44 dcid Exp $ */
#
# Copyright (C) 2008 Third Brigade, Inc.
# All rights reserved.
#
# This program is a free software; you can redistribute it
# and/or modify it under the terms of the GNU General Public
# License (version 3) as published by the FSF - Free Software
# Foundation.
#
# License details at the LICENSE file included with OSSEC or
# online at: http://www.ossec.net/en/licensing.html

CREATE TABLE category
    (
    cat_id      SMALLINT    UNSIGNED NOT NULL   AUTO_INCREMENT,
    cat_name    VARCHAR(32) NOT NULL            UNIQUE,
    PRIMARY KEY (cat_id),
    INDEX       (cat_name)
    );

CREATE TABLE signature 
    ( 
    id          SMALLINT    UNSIGNED NOT NULL   AUTO_INCREMENT,
    rule_id     MEDIUMINT   UNSIGNED NOT NULL   UNIQUE,
    level       TINYINT     UNSIGNED,
    description VARCHAR(255)         NOT NULL,
    PRIMARY KEY (id),
    INDEX       (level),
    INDEX       (rule_id)
    );

CREATE TABLE signature_category_mapping
    (
    id          SMALLINT    UNSIGNED NOT NULL   AUTO_INCREMENT,
    rule_id     MEDIUMINT   UNSIGNED NOT NULL,
    cat_id      SMALLINT    UNSIGNED NOT NULL,
    PRIMARY KEY  (id, rule_id, cat_id)       
    );    

CREATE TABLE server 
    (
    id              SMALLINT    UNSIGNED NOT NULL   AUTO_INCREMENT,
    last_contact    INT         UNSIGNED NOT NULL,
    version         VARCHAR(32)          NOT NULL,
    hostname        VARCHAR(64)          NOT NULL   UNIQUE,
    information     VARCHAR(128)         NOT NULL,    
    PRIMARY KEY  (id) 
    ); 

CREATE TABLE agent 
    (
    id              SMALLINT    UNSIGNED NOT NULL   AUTO_INCREMENT,
    server_id       SMALLINT    UNSIGNED NOT NULL,        
    last_contact    INT         UNSIGNED NOT NULL,
    ip_address      INT         UNSIGNED NOT NULL,
    version         VARCHAR(32)          NOT NULL,
    name            VARCHAR(64)          NOT NULL,
    information     VARCHAR(128)         NOT NULL,    
    PRIMARY KEY  (id, server_id) 
    );

CREATE TABLE location
    (
    id              SMALLINT        UNSIGNED NOT NULL   AUTO_INCREMENT,
    server_id       SMALLINT        UNSIGNED NOT NULL,        
    name            VARCHAR(128)    NOT NULL,
    PRIMARY KEY  (id, server_id)
    );        

CREATE TABLE data
    (
    id              INT         UNSIGNED NOT NULL,
    server_id       SMALLINT    UNSIGNED NOT NULL,
    user            TEXT        NOT NULL,
    full_log        TEXT        NOT NULL,
    PRIMARY KEY  (id, server_id)
    );
    
CREATE TABLE alert 
    (
    id              INT         UNSIGNED NOT NULL, 
    server_id       SMALLINT    UNSIGNED NOT NULL,
    rule_id         MEDIUMINT   UNSIGNED NOT NULL,    
    timestamp       INT         UNSIGNED NOT NULL,
    location_id     SMALLINT    UNSIGNED NOT NULL,
    src_ip          INT         UNSIGNED,
    dst_ip          INT         UNSIGNED,
    src_port        SMALLINT    UNSIGNED,
    dst_port        SMALLINT    UNSIGNED,
    PRIMARY KEY (id, server_id),
    INDEX       time (timestamp),
    INDEX       (rule_id),
    INDEX       (src_ip)
    );