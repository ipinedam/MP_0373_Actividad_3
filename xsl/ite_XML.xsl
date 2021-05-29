<?xml version="1.0" encoding="UTF-8"?>
<!-- Requirimiento 2 de la Actividad 3-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" media-type="text/xml"/>

    <!-- Nos posicionamos en el nodo raíz del fichero xml-->
    <xsl:template match="/ite">

        <!-- Cambiamos el nodo raíz por edix -->
        <edix>

            <!-- Convertimos los atributos nombre y web a elementos-->
            <nombre> 
                <xsl:value-of select="@nombre"/>
            </nombre>
            <web>
                <xsl:value-of select="@web"/>
            </web>

            <!-- Los elementos empresa, telefono, director y jefe de estudios se quedan igual pero los hemos cambiado de posición-->
            <xsl:copy-of select="empresa"/>
            <xsl:copy-of select="telefono"/>
            <xsl:copy-of select="director"/>
            <xsl:copy-of select= "jefe_estudios"/>

            <!-- Convertimos el elemento id de profesor en atributo-->
            <profesores>
                <xsl:for-each select="profesores/profesor">
                    <profesor>
                        <xsl:attribute name="id">
                            <xsl:value-of select="id"/>
                        </xsl:attribute>
                        <xsl:copy-of select="nombre"/>
                    </profesor>
                </xsl:for-each>
            </profesores>

            <!-- Convertimos el atributo id en elemento, dejando los demas elementos igual-->
            <ciclos>
                <xsl:for-each select="ciclos/ciclo">
                <ciclo>
                    <id>
                        <xsl:value-of select="@id"/>
                    </id>
                    <xsl:copy-of select="nombre"/>
                    <xsl_copy-of select="grado"/>
                    <xsl:copy-of select="decretoTitulo"/>
                </ciclo>
                </xsl:for-each>
            </ciclos>
        </edix>

    </xsl:template>
    
</xsl:stylesheet>