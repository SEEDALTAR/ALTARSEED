<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>SEED ALTAR COINS</title>
  <script src="https://cdn.jsdelivr.net/npm/web3@latest/dist/web3.min.js"></script>
  <style>
    body {
      font-family: Arial, sans-serif;
      background: #0d0d0d;
      color: #fff;
      text-align: center;
      padding: 50px;
    }
    .card {
      background: #1a1a1a;
      border-radius: 20px;
      padding: 30px;
      max-width: 500px;
      margin: auto;
      box-shadow: 0px 0px 20px #5a2ec9;
    }
    button, .buy-link {
      background: #5a2ec9;
      color: #fff;
      border: none;
      padding: 12px 24px;
      border-radius: 12px;
      font-size: 16px;
      cursor: pointer;
      margin-top: 20px;
    }
    button:hover {
      display: inline-block;
    }
    button:hover, .buy-link:hover {
      background: #7d4fff;
    }
    a {
      color: #7d4fff;
      text-decoration: none;
    }
  </style>
</head>
<body>
  <div class="card">
    <h1>🌱 SEED ALTAR COINS 🌱</h1>
    <p><strong>Symbol:</strong> ALTAR</p>
    <p><strong>Contract:</strong> 
      <a href="https://basescan.org/token/0x1254290214e593a502b97136bc9d100007f1fcdd" target="_blank">
        0x1254290214e593a502b97136bc9d100007f1fcdd
      </a>
    </p>

    <!-- Connect Wallet Button -->
    <button onclick="connectWallet()">🔗 Connect Wallet</button>
    <p id="walletAddress"></p>

    <!-- Buy Token Button -->
    <a class="buy-link" 
       href="https://rainbow.me/token/base/0x1254290214e593a502b97136bc9d100007f1fcdd" 
       target="_blank">
       💸 Buy SEED ALTAR
    </a>
  </div>

  <script>
    async function connectWallet() {
      if (window.ethereum) {
        try {
          const accounts = await ethereum.request({ method: 'eth_requestAccounts' });
          document.getElementById('walletAddress').innerText = "Connected: " + accounts[0];
        } catch (error) {
          console.error(error);
          alert("Connection failed.");
        }
      } else {
        alert("MetaMask or Rainbow Wallet not found. Please install one.");
      }
    }
  </script>
</body>
</html>
