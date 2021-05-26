<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <head>
                <link rel="stylesheet" type="text/css" href="css/styles.css"/>
                <title><xsl:value-of select="ite/@nombre"/></title>
            </head>
            <body>
                <header>
                    <h1><xsl:value-of select="ite/@nombre"/></h1>
                </header>
                <section>
                <nav id="menu">
                    <ul>
                        <li><a href="#profes">Profesores</a></li>
                        <li><a href="#direccion">Equipo directivo</a></li>
                        <li><a href="#cursos">Cursos</a></li>
                        <li><a href="#contacto">Contacto</a></li>
                    </ul>


                    <!--
                    <h3 class="nombre_empresa"><xsl:value-of select="ite/empresa"/></h3>
                    <div class="datos_nav">Telefono:
                        <a><xsl:attribute name="href">
                            <xsl:value-of select="ite/telefono"/></xsl:attribute>
                            <xsl:value-of select="ite/telefono"/>
                        </a>
                        <a><xsl:attribute name="href">
                            <xsl:value-of select="ite/@nombre"/></xsl:attribute>
                            <xsl:value-of select="ite/@nombre"/>
                        </a>
                    </div>
                -->
                </nav>   
                
                
                
                <!--tabla ID PROFESORES-->
                <table>
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

                <section class="direccion">
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
                <table id="cursos">
                <caption>TABLA CICLOS</caption>
                    <thead>
                        <tr>
                            <th> </th>
                            <xsl:for-each select="ite/ciclos/ciclo">
                                <th><xsl:value-of select="@id"/></th>
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


                <form action="servido.php" method="get">
                    <fieldset><legend><h2>Solicitud de información</h2></legend>
                        <div class="datos-per">
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
                        </div>
                        <div class="checkbox">
                            <h3>Seleccione los cursos sobre los que desea informacion</h3>
                            <div>
                                <input type="checkbox" id="asir" name="asir" value="true"/>
                                <label for="asir">ASIR</label>
                                <input type="checkbox" id="daw" name="daw" value="true"/>
                                <label for="asir">DAW</label>
                                <input type="checkbox" id="dam" name="dam" value="true"/>
                                <label for="asir">DAM</label>
                            </div>

                        </div>
                        <div class="textarea">
                            <h3>Observaciones</h3>
                            <textarea name="observaciones" rows="5" cols="50" placeholder="Siguessiendounhijoputa"></textarea>
                        </div>
                        <div class="submit-reset">
                            <input class="boton" type="submit" value="Enviar formulario"/>
                            <input class="boton" type="reset" value="Limpiar"/>
                        </div>

                    </fieldset>
                </form>          
            </section>
                 
            </body>
            
        </html>
    </xsl:template>
</xsl:stylesheet>
