Feature: Validate API responses
  PERSONAS_CRUD
  probe JSON reponses


Scenario Outline: To probe route code response  /perfil_profesional
    When I send "<method>" request to "<route>" where body is json "<bodyreq>"
    Then the response code should be "<codres>"      

    Examples: 
    |method |route                  |bodyreq                 |codres       |
    |GET    |/v1/perfil_profesional |./files/req/Vacio.json  |200 OK       |
    |GET    |/v1/perfil_profesiona  |./files/req/Vacio.json  |404 Not Found|
    |POST   |/v1/perfil_profesiona  |./files/req/Vacio.json  |404 Not Found|
    |PUT    |/v1/perfil_profesiona  |./files/req/Vacio.json  |404 Not Found|
    |DELETE |/v1/perfil_profesiona  |./files/req/Vacio.json  |404 Not Found|

Scenario Outline: To probe response route /perfil_profesional       
    When I send "<method>" request to "<route>" where body is json "<bodyreq>"
    Then the response code should be "<codres>"      
    And the response should match json "<bodyres>"

    Examples: 
    |method |route                   |bodyreq                |codres     |bodyres                         |
    |GET    |/v1/perfil_profesional  |./files/req/Vacio.json |200 OK     |./files/res3/Vok2.json          |
    |POST   |/v1/perfil_profesional  |./files/req/Vacio.json |200 OK     |./files/res0/Ierr6.json         |
    |POST   |/v1/perfil_profesional  |./files/req/Yt1.json   |201 Created|./files/res3/Vok1.json          |
    |POST   |/v1/perfil_profesional  |./files/req/Nt1.json   |200 OK     |./files/res3/Ierr1.json         |
    |POST   |/v1/perfil_profesional  |./files/req/Nt2.json   |200 OK     |./files/res3/Ierr2.json         |
    |POST   |/v1/perfil_profesional  |./files/req/Nt3.json   |200 OK     |./files/res3/Ierr3.json         |
    |POST   |/v1/perfil_profesional  |./files/req/Nt4.json   |200 OK     |./files/res3/Ierr4.json         |
    |POST   |/v1/perfil_profesional  |./files/req/Nt5.json   |200 OK     |./files/res3/Ierr5.json         | 
    |PUT    |/v1/perfil_profesional  |./files/req/Yt2.json   |200 OK     |./files/res3/Vok1.json          |
    |GETID  |/v1/perfil_profesional  |./files/req/Vacio.json |200 OK     |./files/res3/Vok1.json          |
    |DELETE |/v1/perfil_profesional  |./files/req/Vacio.json |200 OK     |./files/res3/Ino.json           |
    |DELETE |/v1/perfil_profesional  |./files/req/Vacio.json |200 OK     |./files/res3/Vok1.json          |