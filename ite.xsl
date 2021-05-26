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
                <main>
                <nav>
                    <h3 class="nombre_empresa"><xsl:value-of select="ite/empresa"/></h3>
                    <div class="datos_nav">Telefono:
                        <a><xsl:attribute name="href">
                            <xsl:value-of select="ite/telefono"/></xsl:attribute><!--enlace-->
                            <xsl:value-of select="ite/telefono"/> <!-- texto-->
                        </a>
                        <a><xsl:attribute name="href">
                            <xsl:value-of select="ite/@nombre"/></xsl:attribute><!--enlace-->
                            <xsl:value-of select="ite/@nombre"/> <!-- texto-->
                        </a>
                    </div>
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

                <p>Jefe de estudios</p>
                <ul>
                    
                    <li>Nombre:<xsl:value-of select="ite/jefe_estudios/nombre"/></li>
                    <li>Despacho:<xsl:value-of select="ite/jefe_estudios/despacho"/></li>
                </ul>

                <p>Director</p>
                <ul>
                   
                    <li>Nombre:<xsl:value-of select="ite/director/nombre"/></li>
                    <li>Despacho:<xsl:value-of select="ite/director/despacho"/></li>
                </ul>

               <!--Tabla CICLOS--> 
                <table>
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
                    <fieldset><legend>Solicitud de información</legend>
                        <div>
                            <P>Datos Personales</P>
                            <label for="nombre">Nombre</label>
                            <input type="text" id="nombre" name="nombre"/>
                            <label for="apellidos">Apellidos</label>
                            <input type="text" id="apellidos" name="apellidos"/>
                        </div>
                        <div>
                            <p>Seleccione los cursos sobre los que desea informacion</p>
                            <label for="asir">ASIR</label>
                            <input type="checkbox" id="asir" name="asir" value="true"/>
                            <label for="asir">DAW</label>
                            <input type="checkbox" id="daw" name="daw" value="true"/>
                            <label for="asir">DAM</label>
                            <input type="checkbox" id="dam" name="dam" value="true"/>
                        </div>
                        <div>
                            <p>Observaciones</p>
                            <textarea name="observaciones" rows="5" cols="50"/>
                        </div>
                        <input class="boton" type="submit" value="Enviar"/>
                        <input class="boton" type="reset" value="Limpiar Formulario"/>
    
                    </fieldset>
                </form>          
                </main>
                 
            </body>
            
        </html>
    </xsl:template>
</xsl:stylesheet>
