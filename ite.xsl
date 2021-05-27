<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <!-- Introducimos en el head el link al css
            y recuperamos "nombre" del XML usando value-of 
            para ponerlo de título-->
            <head>
                <link rel="stylesheet" type="text/css" href="css/styles.css"/>
                <title><xsl:value-of select="ite/@nombre"/></title>
            </head>
            <body>
                <!-- Tenemos un header que se compone de un h1 con el nombre,
                    recuperado análogamente al title -->
                <header>
                    <h1><xsl:value-of select="ite/@nombre"/></h1>
                </header>
                <!-- Posteriormente tenemos un section, que hará las veces
                    de main (descartado por problemas de soprote en Internet Explorer)
                -->
                <section>
                <!-- Dentro tenemos un nav, que a su vez se compone de una lista
                    desordenada, que tiene enlaces a las secciones posteriores -->
                <nav id="menu">
                    <ul>
                        <li><a href="#profes">Profesores</a></li>
                        <li><a href="#direccion">Equipo directivo</a></li>
                        <li><a href="#cursos">Cursos</a></li>
                        <li><a href="#contacto">Contacto</a></li>
                    </ul>
                </nav>   

                <!--tabla ID PROFESORES-->
                <!-- La tabla contiene un caption, asignado manualmente
                    unos th como títulos
                    y un tbody, dentro del cual recorremos con un forEach
                    el conjunto de profesor dentro de profesores, 
                    y colcamos co value-of cada id y nombre -->
                <table id="profes">
                    <caption>TABLA ID PROFESORES</caption>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>PROFESOR</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="ite/profesores/profesor">
                             <tr>     
                                 <td><xsl:value-of select="id"/></td>
                                 <td><xsl:value-of select="nombre"/></td>  
                             </tr>
                        </xsl:for-each> 
                    </tbody>       
                </table>

                <!--EQUIPO DIRECTIVO-->
                <!-- En equipo directivo tenemos 2 artículos,
                    umo para jefe de estudios y otro para director,
                    dentro de los cuales hay por un lado un h2 asignado manualmente
                    y luego una lista desordenada, donde leemos nombre y despacho
                    de jefe_estudios y director respectivamente -->
                <section id="direccion">
                    <article>
                        <h2>Jefe de estudios</h2>
                        <ul>
                            <li>Nombre: <xsl:value-of select="ite/jefe_estudios/nombre"/></li>
                            <li>Despacho: <xsl:value-of select="ite/jefe_estudios/despacho"/></li>
                        </ul>
                    </article>
                    <article>
                        <h2>Director</h2>
                        <ul>
                            <li>Nombre: <xsl:value-of select="ite/director/nombre"/></li>
                            <li>Despacho: <xsl:value-of select="ite/director/despacho"/></li>
                        </ul>
                    </article>
                </section>


               <!--Tabla CICLOS--> 
               <!-- La tabla de cursos tiene una estructura análoga
                a profesores, pero los th del thead son leídos con un for-eacj
                leyendo el id del xml (ASIR, DAM, DAW) -->
                <table id="cursos">
                <caption>TABLA CICLOS</caption>
                    <thead>
                        <tr>
                            <th> </th>
                            <!-- Llevaremos a sección de los checkbox del formulario si pinchan en cualquier curso -->
                            <xsl:for-each select="ite/ciclos/ciclo">
                                <th><a><xsl:attribute name="href">#cursosCheckbox</xsl:attribute>
                                    <xsl:value-of select="@id"/></a></th>
                            </xsl:for-each>
                        </tr>  
                    </thead>
                    <tbody>
                            <tr>
                                <td>NOMBRE</td>
                                <xsl:for-each select="ite/ciclos/ciclo">
                                    <td><xsl:value-of select="nombre"/></td>
                                </xsl:for-each>
                            </tr>
                            <tr>
                                <td>GRADO</td>
                                <xsl:for-each select="ite/ciclos/ciclo">
                                    <td><xsl:value-of select="grado"/></td>
                                </xsl:for-each>
                            </tr>
                            <tr>
                                <td>DECRETO TITULO AÑO</td>
                                <xsl:for-each select="ite/ciclos/ciclo">
                                    <td><xsl:value-of select="decretoTitulo/@año"/></td>
                                </xsl:for-each>
                            </tr>
                    </tbody>      
                </table>    

                <!-- FORMULARIO -->
                <!-- Por el lado del formulario, comenzamos con una leyenda, que es el título-->
                <form id="contacto" action="servido.php" method="get">
                    <fieldset><legend><h2>Solicitud de información</h2></legend>
                        <!-- Dentro tendremos varios section, para datos personales, 
                        los checkbox de cursos, el textarea de observaciones y el par de botones -->
                        <!-- Utilizaremos label para todos los input con título, de forma que al pulsar
                        nos lleve al input correspondiente -->
                        <section class="datos-per">
                            <h3>Datos Personales</h3>
                            <div>
                                <label for="nombre">Nombre</label>
                                <input type="text" id="nombre" name="nombre"/>
                            </div>
                            <div>
                                <label for="apellidos">Apellidos</label>
                                <input type="text" id="apellidos" name="apellidos"/>
                            </div>
                            <div>
                                <label for="mail">Email</label>
                                <input type="email" id="mail" name="mail"/>
                            </div>
                        </section>
                        <section class="checkbox" id="cursosCheckbox">
                            <h3>Seleccione los cursos sobre los que desea informacion</h3>
                            <div>
                                <div>
                                    <input type="checkbox" id="asir" name="asir" value="true"/>
                                    <label for="asir">ASIR</label>
                                </div>
                                <div>
                                    <input type="checkbox" id="daw" name="daw" value="true"/>
                                    <label for="daw">DAW</label>
                                </div>
                                <div>
                                    <input type="checkbox" id="dam" name="dam" value="true"/>
                                    <label for="dam">DAM</label>
                                </div>
                            </div>

                        </section>
                        <section class="textarea">
                            <label for="observaciones"><h3>Observaciones</h3></label> 
                            <textarea name="observaciones" id="observaciones" rows="5" cols="50" placeholder="Pregúntanos lo que quieras"></textarea>
                        </section>
                        <section class="submit-reset">
                            <input class="boton" type="submit" value="Enviar formulario"/>
                            <input class="boton" type="reset" value="Limpiar"/>
                        </section>
                    </fieldset>
                </form>          
            </section>

            <!-- BOTÓN VOLVER -->
            <!-- Se compone simplemente de un botón que nos lleva al menú superior -->
            <div class="volver">
                <a class="boton" href="#menu"><button name="volver">Volver</button></a>     
            </div>
            
            <!-- FOOTER -->
            <!-- Por último tenemos un footer, dentro del cual tenemos una lista desordenada para teléfono
                y web, que serán además un link al teléfono y a la web-->
            <footer>
                <ul>
                    <li>Telefono:
                        <a><xsl:attribute name="href"><xsl:value-of select="ite/telefono"/></xsl:attribute>
                            <xsl:value-of select="ite/telefono"/>
                        </a>
                    </li>
                    <li>
                        <a><xsl:attribute name="href">
                            <xsl:value-of select="ite/@web"/></xsl:attribute>
                            <xsl:value-of select="ite/@nombre"/>
                        </a>
                    </li>
                </ul>
            </footer>            
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
