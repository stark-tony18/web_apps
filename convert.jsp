<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.util.HashMap" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Temperature Conversion Result</title>
</head>
<body>
    <h1>Temperature Conversion Result</h1>

    <%-- Retrieve form parameters --%>
    <% String temperatureStr = request.getParameter("temperature");
       String unit = request.getParameter("unit");

       if (temperatureStr != null && unit != null) {
           try {
               double temperature = Double.parseDouble(temperatureStr);
               double convertedTemperature = (unit.equals("C")) ? celsiusToFahrenheit(temperature) : fahrenheitToCelsius(temperature);

               // Format the temperatures to two decimal places
               DecimalFormat df = new DecimalFormat("#.##");
               String originalTemperatureFormatted = df.format(temperature);
               String convertedTemperatureFormatted = df.format(convertedTemperature);

               // Display the result
               out.println("<p>" + originalTemperatureFormatted + " " + unit + " is equal to " + convertedTemperatureFormatted + " " + ((unit.equals("C")) ? "Fahrenheit" : "Celsius") + ".</p>");
           } catch (NumberFormatException e) {
               out.println("<p>Invalid temperature value. Please enter a valid number.</p>");
           }
       } else {
           out.println("<p>Invalid input. Please enter both temperature value and unit.</p>");
       }
    %>

    <p><a href="temperature_converter.html">Back to Converter</a></p>
</body>
</html>

<%! 
    // Method to convert Celsius to Fahrenheit
    private double celsiusToFahrenheit(double celsius) {
        return (celsius * 9/5) + 32;
    }

    // Method to convert Fahrenheit to Celsius
    private double fahrenheitToCelsius(double fahrenheit) {
        return (fahrenheit - 32) * 5/9;
    }
%>

