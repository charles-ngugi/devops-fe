import React from 'react';
import './App.css';
import { BrowserRouter as Router, Route, Routes, Link } from 'react-router-dom'; 
import About from './About'; 

function App() {
  return (
    <Router>
      <div className="App">
        <h1>Hello, React! Welcome to the DevOps FE App.</h1>

        {/* Navigation links */}
        <nav>
          <Link to="/">Home</Link> | <Link to="/about">About</Link>
        </nav>

        {/* Routing */}
        <Routes>
          {/* The home page (default route) */}
          <Route path="/" element={<h2>Home Page</h2>} />

          {/* The about page */}
          <Route path="/about" element={<About />} />
        </Routes>
      </div>
    </Router>
  );
}

export default App;

