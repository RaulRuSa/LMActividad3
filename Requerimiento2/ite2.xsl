<?xml version="1.0" encoding="UTF-8"?>
<<<<<<< HEAD
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"> 
<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    <xsl:template match="/">
        <ite>
            <nombre>
                <xsl:value-of select="ite/@nombre"/>
            </nombre>
            <datos_empresa>
                <nombre>
                    <xsl:value-of select="ite/empresa"/>
                </nombre>
                <telefono>
                    <xsl:value-of select="ite/telefono"/>
                </telefono>
                <web>
                    <xsl:value-of select="ite/@web"/>
                </web>
            </datos_empresa>
            <personal>
                <profesores>
                    <xsl:for-each select="ite/profesores/profesor">
                    <profesor>
                        <id>
                            <xsl:value-of select="id"/>
                        </id>
                        <nombre>
                            <xsl:value-of select="nombre"/>
                        </nombre>
                    </profesor>
                </xsl:for-each>
                </profesores>
                <director>
                    <nombre>
                        <xsl:value-of select="ite/director/nombre"/>
                    </nombre>
                    <despacho>
                        <xsl:value-of select="ite/director/despacho"/>
                    </despacho>
                </director>
                <jefe_estudios>
                    <nombre>
                        <xsl:value-of select="ite/jefe_estudios/nombre"/>
                    </nombre>
                    <despacho>
                        <xsl:value-of select="ite/jefe_estudios/despacho"/>
                    </despacho>
                </jefe_estudios>
            </personal>
            <ciclos>
                <xsl:for-each select="ite/ciclos/ciclo">    
                    <ciclo>
                        <id>
                            <xsl:value-of select="@id"/>
                        </id>
                        <nombre>
                            <xsl:value-of select="nombre"/>
                        </nombre>
                        <grado>
                            <xsl:value-of select="grado"/>
                        </grado>
                        <decretoTitulo>
                            <año>
                                <xsl:value-of select="decretoTitulo/@anio"/>
                            </año>
                        </decretoTitulo>
                    </ciclo>
                </xsl:for-each>    
            </ciclos>      
        </ite>               
    </xsl:template>
</xsl:stylesheet>
=======
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
    <ite>
        <nombre>
            <xsl:value-of select="ite/@nombre"/>
        </nombre>
        <datos_empresa>
            <nombre>
                <xsl:value-of select="ite/empresa"/>
            </nombre>
            <telefono>
                <xsl:value-of select="ite/telefono"/>
            </telefono>
            <web>
                <xsl:value-of select="ite/@web"/>
            </web>
        </datos_empresa>
        <personal>
            <profesores>
                <xsl:for-each select="ite/profesores/profesor">
                <profesor >
                    <id>
                        <xsl:value-of select="id"/>
                    </id>
                    <nombre>
                        <xsl:value-of select="nombre"/>
                    </nombre>
                </profesor>
            </xsl:for-each>
            </profesores>
            <director>
                <nombre>
                    <xsl:value-of select="ite/director/nombre"/>
                </nombre>
                <despacho>
                    <xsl:value-of select="ite/director/despacho"/>
                </despacho>
            </director>
            <jefe_estudios>
                <nombre>
                    <xsl:value-of select="ite/jefe_estudios/nombre"/>
                </nombre>
                <despacho>
                    <xsl:value-of select="ite/jefe_estudios/despacho"/>
                </despacho>
            </jefe_estudios>
        </personal>
        <ciclos>
            <xsl:for-each select="ite/ciclos/ciclo">    
                <ciclo id="ASIR">
                    <id>
                        <xsl:value-of select="@id"/>
                    </id>
                    <nombre>
                        <xsl:value-of select="nombre"/>
                    </nombre>
                    <grado>
                        <xsl:value-of select="grado"/>
                    </grado>
                    <decretoTitulo>
                        <año>
                            <xsl:value-of select="decretoTitulo/@año"/>
                        </año>
                    </decretoTitulo>
                </ciclo>
            </xsl:for-each>    
        </ciclos>      
    </ite>               

    </xsl:template>
</xsl:stylesheet>
>>>>>>> 966efd94ed6e39a7547b937c3e7104494a730ea0
