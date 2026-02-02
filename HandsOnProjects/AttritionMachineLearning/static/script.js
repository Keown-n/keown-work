document.getElementById('predictionForm').addEventListener('submit', async function (e) {
    e.preventDefault();

    const formData = new FormData(this);
    const submitBtn = document.getElementById('predictBtn');
    const originalBtnText = submitBtn.innerText;

    submitBtn.disabled = true;
    submitBtn.innerText = 'Analyzing...';

    try {
        const response = await fetch('/predict', {
            method: 'POST',
            body: formData
        });

        const result = await response.json();

        displayResult(result);
    } catch (error) {
        console.error('Error:', error);
        alert('An error occurred while processing your request.');
    } finally {
        submitBtn.disabled = false;
        submitBtn.innerText = originalBtnText;
    }
});

function displayResult(data) {
    const resultCard = document.getElementById('result');
    const riskLevelSpan = document.getElementById('riskLevel');
    const probabilitySpan = document.getElementById('probability');
    const strategiesList = document.getElementById('strategiesList');

    resultCard.classList.remove('hidden');

    // Update Risk Level
    riskLevelSpan.innerText = data.risk_level;
    riskLevelSpan.className = 'value'; // Reset classes
    riskLevelSpan.classList.add(`risk-${data.risk_level.toLowerCase()}`);

    // Update Probability
    probabilitySpan.innerText = (data.probability * 100).toFixed(1) + '%';

    // Update Strategies
    strategiesList.innerHTML = '';
    data.strategies.forEach(strategy => {
        const li = document.createElement('li');
        li.innerText = strategy;
        strategiesList.appendChild(li);
    });

    // Update AI Analysis
    const aiAnalysisDiv = document.getElementById('aiAnalysis');
    // Simple formatting: replace newlines with <br>
    aiAnalysisDiv.innerHTML = data.ai_analysis.replace(/\n/g, '<br>');

    // Scroll to result on mobile
    if (window.innerWidth < 1024) {
        resultCard.scrollIntoView({ behavior: 'smooth' });
    }
}
