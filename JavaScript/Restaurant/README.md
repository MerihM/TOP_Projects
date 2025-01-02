# Restaurant Menu Project

This project is a restaurant menu website that showcases various features related to displaying restaurant menus and utilizing dynamic content loading. It was developed as a learning experience for bundling with Webpack, working with JSON data, generating a webpage using JavaScript, and enhancing responsiveness.

## Features

### Dynamic Tabs

The project includes dynamic tabs that display content based on their names. This allows users to explore different sections of the restaurant's menu seamlessly.

### Rotating Menu

A unique feature of the project is the rotating menu based on the day of the week. Each day corresponds to a specific cuisine, and the menu content changes accordingly. The rotation is as follows:
- Monday: Italian Cuisine
- Tuesday: Kenyan Cuisine
- Wednesday: French Cuisine
- Thursday: Mexican Cuisine
- Friday: Hawaiian Cuisine
- Saturday: Japanese Cuisine
- Sunday: Balkans Cuisine

All cuisine information is loaded from a JSON file, providing flexibility and easy updates to the menu.

## Implementation Details

- The entire webpage is generated dynamically using JavaScript, with minimal content included in the HTML file.
- Webpack was utilized for bundling and managing project assets.
- JSON data is used to store and load cuisine information for the rotating menu.
- While the webpage is responsive, it may not display correctly on mobile devices due to the project's focus on learning and implementation rather than complete responsiveness.

## Usage

1. Clone this repository to your local machine.
2. Navigate to the project directory in the terminal.
3. Run `npm install` to install the required dependencies.
4. Run `npm run build` to build the project using Webpack.
5. Open the generated `index.html` file in your browser to explore the restaurant menu.

## Acknowledgements

The project was created as part of a learning journey and draws inspiration and knowledge from various online resources and tutorials.
