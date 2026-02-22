// recruitment.js

const express = require('express');
const router = express.Router();

// Get all recruitment listings
router.get('/recruitments', (req, res) => {
    res.json({
        message: 'List of recruitments'
    });
});

// Create a new recruitment listing
router.post('/recruitments', (req, res) => {
    const newRecruitment = req.body;
    res.status(201).json({
        message: 'Recruitment created',
        recruitment: newRecruitment
    });
});

// Get a single recruitment listing by id
router.get('/recruitments/:id', (req, res) => {
    const { id } = req.params;
    res.json({
        message: `Details of recruitment ${id}`
    });
});

// Update a recruitment listing by id
router.put('/recruitments/:id', (req, res) => {
    const { id } = req.params;
    const updatedRecruitment = req.body;
    res.json({
        message: `Recruitment ${id} updated`,
        recruitment: updatedRecruitment
    });
});

// Delete a recruitment listing by id
router.delete('/recruitments/:id', (req, res) => {
    const { id } = req.params;
    res.json({
        message: `Recruitment ${id} deleted`
    });
});

module.exports = router;