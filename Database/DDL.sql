CREATE TABLE USUARIO(
    ID NUMBER PRIMARY KEY,
    NOME VARCHAR2(200) NOT NULL
);
CREATE TABLE DEVICE(
    ID NUMBER PRIMARY KEY, 
    CODIGO VARCHAR2(255),
    MAC_ADDRESS VARCHAR2(255),
    USUARIO_ID NUMBER,
    CONSTRAINT fk_usuario_device
    FOREIGN KEY (USUARIO_ID)
    REFERENCES USUARIO(ID) 
);
CREATE TABLE LOCAL(
    ID NUMBER PRIMARY KEY, 
    LATITUDE NUMBER(9,6) NOT NULL, 
    LONGITUDE NUMBER(9,6) NOT NULL, 
    NOME VARCHAR2(200)
);
CREATE TABLE REGISTRO(
    ID NUMBER PRIMARY KEY, 
    DATA_HORA TIMESTAMP(6),
    LOCAL_ID NUMBER NOT NULL, 
    USUARIO_ID NUMBER NOT NULL, 
    CONSTRAINT fk_local_registro 
    FOREIGN KEY (LOCAL_ID)
    REFERENCES LOCAL(ID),
    CONSTRAINT fk_usuario_registro
    FOREIGN KEY (USUARIO_ID)
    REFERENCES USUARIO(ID)    
);
CREATE TABLE DEMARCACAO(
    ID NUMBER PRIMARY KEY,
    NOME VARCHAR2(255) NOT NULL, 
    ESPACO_DEMARCADO SDO_GEOMETRY,
    USUARIO_ID NUMBER NOT NULL, 
    CONSTRAINT fk_usuario_demarcacao
    FOREIGN KEY (USUARIO_ID)
    REFERENCES USUARIO(ID)
);