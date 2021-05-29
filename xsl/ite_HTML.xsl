<?xml version="1.0" encoding="UTF-8"?>
<!-- Requerimiento 1 de la Actividad 3-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/ite">
        <html>
            <head>
                <meta charset="UTF-8"/>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
                <meta name="description" content="Web de SoftPin Games" />
                <title>EDIX</title>
                <link rel="stylesheet" type="text/css" href="css/estilos.css"/>
            </head>
            <body>
                <div class="contenedor">
                    <!-- Cabecera de la página incluye el nombre de la empresa, número de contacto y web con su enlace-->
                    <header>
                        <h1>
                            <xsl:value-of select="@nombre"/>
                        </h1>
                        <h2>
                            Teléfono de contacto: <xsl:value-of select="telefono"/><br/>
                            Empresa: <xsl:value-of select="empresa"/><br/>
                            Página web: <a href="{@web}" target="_blank"> <xsl:value-of select="@web"/> </a>
                        </h2>
                    </header>
                    <!-- Primera tabla con los profesores y su ID, se han creado enlaces para cada profesor para el envio de correos-->
                    <section>
                        <table>
                            <caption>
                                <h3>
                                    Profesorado
                                </h3>
                            </caption>
                            <thead>
                                <tr>
                                    <th>
                                        ID
                                    </th>
                                    <th>
                                        Nombre
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                <xsl:for-each select="profesores/profesor">
                                <tr>
                                    <td>
                                        <xsl:value-of select="id"/>
                                    </td>
                                    <!-- Enlaces para los correos a los profesores-->
                                    <td>
                                        <a href="mailto:{nombre}@edix.com?subject=Consulta"> <xsl:value-of select="nombre"/></a>
                                    </td>
                                </tr>
                                </xsl:for-each>
                            </tbody>
                        </table>  
                        <!-- Lista no ordenada con el director y el jefe de estudios-->
                        <ul>
                            <h3>
                                Dirección del centro formativo
                            </h3>
                            <li>
                                Director: <xsl:value-of select="director/nombre"/> <br/> Despacho: <xsl:value-of select="director/despacho"/> 
                            </li>
                            <li>
                                Jefe de estudios: <xsl:value-of select="jefe_estudios/nombre"/> <br/> Despacho: <xsl:value-of select="jefe_estudios/despacho"/> 
                            </li>
                        </ul>
                        <!-- Segunda tabla con los ciclos formativos y sus datos-->
                        <table>
                            <caption>
                                <h3>
                                    Ciclos Formativos
                                </h3>
                            </caption>
                            <tr>
                                <th>
                                    Nombre
                                </th>
                                <th>
                                    ID
                                </th>
                                <th>
                                    Grado
                                </th>
                                <th>
                                    Año
                                </th>
                            </tr>
                            <xsl:for-each select="ciclos/ciclo">
                                <tr>
                                    <td>
                                        <xsl:value-of select="nombre"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="@id"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="grado"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="decretoTitulo/@año"/>
                                    </td>
                                </tr>
                            </xsl:for-each>
                        </table>
                    </section>
                    <!-- Formulario de contacto que cuenta con los ciclos formativos de la lista anterior-->
                    <aside>
                        <div class="margen">
                            <h2>
                                Formulario para consultas
                            </h2>
                        </div>                       
 
                        <form>
                            <div class="formulario">
                                <p>
                                    <label for="nombre">Nombre: </label>
                                    <input type="text" name="nombre" placeholder="Escribe tu Nombre y Apellidos" size="35"  autofocus="" />
                                </p>
                                <p>
                                    <label for="email">E-mail: </label>
                                    <input type="email" name="email" placeholder="Escribe tu e-mail" size="35" required="" />
                                </p>
                                <!-- Desplegable con los ciclos formativos -->
                                <p>
                                    <label for="ciclo">Ciclo: </label>
                                    <select name="ciclo">
                                        <option value="consulta" selected=""> ------------- </option>
                                        <xsl:for-each select="ciclos/ciclo">
                                            <xsl:element name="option">
                                                <xsl:attribute name="value">
                                                    <xsl:value-of select="@id"/>
                                                </xsl:attribute> 
                                                <xsl:value-of select="nombre"/> 
                                            </xsl:element>
                                        </xsl:for-each>
                                    </select>
                                </p>
                            </div>

                            <!-- Caja de comentarios-->
                            <p>
                                <label for="comentarios">Comentarios: </label>
                                <br />
                                <textarea rows="10" cols="45" name="comentarios"></textarea>
                            </p>
                            <p>
                                <!-- Incluimos un boton de "submit" y otro de "reset". 
                                    El primero sirve para enviar los datos del formulario y el segundo para limpiarlo-->
                                <input type="submit" value="Enviar datos" />
                                <input type="reset" value="Limpiar formulario" />
                            </p>

                        </form>   
                    </aside>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>