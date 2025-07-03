<div align="center">

# 🤖 ZALAMATI

### Advanced AI Agentic Platform

*Autonomous multi-modal AI agent with GUI control, system automation, and continuous reasoning capabilities*

[![MIT License](https://img.shields.io/badge/License-MIT-green.svg)](https://choosealicense.com/licenses/mit/)
[![Python 3.9+](https://img.shields.io/badge/python-3.9+-blue.svg)](https://www.python.org/downloads/)
[![Node.js 16+](https://img.shields.io/badge/node.js-16+-green.svg)](https://nodejs.org/)
[![FastAPI](https://img.shields.io/badge/FastAPI-0.104-red.svg)](https://fastapi.tiangolo.com/)
[![React](https://img.shields.io/badge/React-18-blue.svg)](https://reactjs.org/)
[![TypeScript](https://img.shields.io/badge/TypeScript-4.9-blue.svg)](https://www.typescriptlang.org/)

![ZALAMATI Demo](https://via.placeholder.com/800x400/0f172a/6366f1?text=ZALAMATI+AI+Agent)

[🚀 Quick Start](#-quick-start) • [📖 Documentation](#-documentation) • [🛠️ Features](#️-features) • [🤝 Contributing](#-contributing)

</div>

---

## 🎯 Overview

ZALAMATI is a cutting-edge autonomous AI agent platform that bridges the gap between artificial intelligence and real-world automation. Built with modern technologies, it provides seamless integration between AI reasoning and system control.

### Key Highlights

- 🎮 **GUI Automation**: Direct control of desktop applications
- 💻 **System Commands**: PowerShell, CMD, and Python execution
- 🌐 **Web Integration**: Intelligent web browsing and search
- 📁 **File Management**: Advanced file and directory operations
- 🧠 **Memory System**: Context-aware conversation history
- 🔄 **Continuous Mode**: Autonomous multi-step task execution
- 🎨 **Modern UI**: React-based interface inspired by Manus AI

## 🛠️ Features

### 🤖 AI Capabilities
- **Multi-Model Support**: Gemini, OpenAI, Anthropic APIs
- **Reasoning Engine**: Advanced step-by-step problem solving
- **Memory Management**: Persistent conversation context
- **Tool Integration**: Seamless tool selection and execution

### 🖥️ System Integration
- **GUI Automation**: PyAutoGUI-powered desktop control
- **Command Execution**: Secure PowerShell/CMD integration
- **File Operations**: Read, write, create, delete operations
- **Directory Management**: Recursive operations and tree views

### 🌐 Web Capabilities
- **Search Integration**: DuckDuckGo and Google search
- **Content Extraction**: Intelligent web scraping
- **Browser Automation**: Planned Selenium integration

### 🔧 Developer Features
- **WebSocket Communication**: Real-time agent interaction
- **RESTful APIs**: Comprehensive tool endpoints
- **Type Safety**: Full TypeScript implementation
- **Error Handling**: Robust error recovery
- **Security**: Input validation and sanitization

## 🏗️ Architecture

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Frontend      │    │    Backend      │    │   AI Models     │
│                 │    │                 │    │                 │
│ React + TS      │◄──►│ FastAPI         │◄──►│ Gemini API      │
│ Material-UI     │    │ LangChain       │    │ OpenAI API      │
│ Zustand         │    │ WebSockets      │    │ Anthropic API   │
│ Socket.IO       │    │ SQLAlchemy      │    │                 │
└─────────────────┘    └─────────────────┘    └─────────────────┘
         │                        │                        │
         ▼                        ▼                        ▼
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Tools Layer   │    │  Memory System  │    │ Security Layer  │
│                 │    │                 │    │                 │
│ File Ops        │    │ Session Storage │    │ Input Validation│
│ GUI Control     │    │ Context Memory  │    │ API Key Mgmt    │
│ Web Search      │    │ History Tracking│    │ Rate Limiting   │
│ System Commands │    │ Learning Insights│    │ Error Handling  │
└─────────────────┘    └─────────────────┘    └─────────────────┘
```

## 🚀 Quick Start

### Prerequisites

- **Python** 3.9+ ([Download](https://www.python.org/downloads/))
- **Node.js** 16+ ([Download](https://nodejs.org/))
- **Git** ([Download](https://git-scm.com/))

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/ZALAMATI.git
   cd ZALAMATI
   ```

2. **Backend Setup**
   ```bash
   cd backend
   python -m venv venv
   
   # Windows
   .\venv\Scripts\activate
   
   # macOS/Linux
   source venv/bin/activate
   
   pip install -r requirements.txt
   ```

3. **Environment Configuration**
   ```bash
   cp .env.example .env
   # Edit .env with your API keys
   ```

4. **Frontend Setup**
   ```bash
   cd ../frontend
   npm install
   ```

5. **Start the Application**
   
   Terminal 1 (Backend):
   ```bash
   cd backend
   python main.py
   ```
   
   Terminal 2 (Frontend):
   ```bash
   cd frontend
   npm start
   ```

6. **Access the Application**
   - Frontend: http://localhost:3000
   - Backend API: http://localhost:8000
   - API Docs: http://localhost:8000/docs

### 🔑 API Keys Setup

#### Gemini API (Recommended - Free)
1. Visit [Google AI Studio](https://makersuite.google.com/app/apikey)
2. Create an API key
3. Add to `.env`: `GEMINI_API_KEY=your_key_here`

#### Optional APIs
- **OpenAI**: [Platform API Keys](https://platform.openai.com/api-keys)
- **Anthropic**: [Console](https://console.anthropic.com/)

## 📖 Documentation

### Usage Examples

#### Basic Agent Commands
```
🤖 "List files in the current directory"
🤖 "Search for latest AI news"
🤖 "Take a screenshot of the desktop"
🤖 "Run PowerShell command 'Get-Process'"
🤖 "Create a Python script to analyze data"
```

#### API Usage
```python
import requests

# File operations
response = requests.post('http://localhost:8000/api/file_operations/', json={
    "action": "read",
    "file_path": "example.txt"
})

# Web search
response = requests.post('http://localhost:8000/api/web_search/', json={
    "query": "Python machine learning",
    "num_results": 5
})

# GUI automation
response = requests.post('http://localhost:8000/api/gui_automation/', json={
    "action": "screenshot"
})
```

### Configuration

#### Security Settings
```env
# Production settings
SECRET_KEY=your-super-secret-key
DEBUG=false
ALLOWED_HOSTS=yourdomain.com
```

#### Agent Behavior
```env
# Agent configuration
MAX_ITERATIONS=50
ENABLE_CONTINUOUS_MODE=true
MEMORY_SIZE=1000
MAX_FILE_SIZE=10485760
```

## 🧪 Testing

### Backend Tests
```bash
cd backend
pytest tests/ -v
```

### Frontend Tests
```bash
cd frontend
npm test
```

### Integration Tests
```bash
# Test API endpoints
curl -X POST http://localhost:8000/api/web_search/ \
  -H "Content-Type: application/json" \
  -d '{"query": "test", "num_results": 3}'
```

## 🚀 Deployment

### Docker Deployment
```bash
# Build and run with Docker Compose
docker-compose up --build
```

### Production Deployment
```bash
# Backend with Gunicorn
gunicorn main:app --host 0.0.0.0 --port 8000 --workers 4

# Frontend build
npm run build
```

## 🛡️ Security

- ✅ Input validation and sanitization
- ✅ API key encryption
- ✅ Rate limiting
- ✅ CORS configuration
- ✅ Security headers
- ✅ Command injection prevention

## 🗺️ Roadmap

- [ ] **v1.1**: Enhanced GUI automation with OCR
- [ ] **v1.2**: Browser automation with Selenium
- [ ] **v1.3**: Plugin system for custom tools
- [ ] **v1.4**: Multi-agent collaboration
- [ ] **v1.5**: Voice interface integration
- [ ] **v2.0**: Self-improving agent capabilities

## 🤝 Contributing

We welcome contributions! Please see our [Contributing Guide](CONTRIBUTING.md) for details.

### Development Setup
```bash
# Install development dependencies
pip install -r requirements-dev.txt
npm install --include=dev

# Run pre-commit hooks
pre-commit install
```

### Code Style
- **Python**: Black, isort, flake8
- **TypeScript**: ESLint, Prettier
- **Commits**: Conventional Commits

## 📜 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🆘 Support

- 📚 [Documentation](./docs/)
- 🐛 [Issues](https://github.com/yourusername/ZALAMATI/issues)
- 💬 [Discussions](https://github.com/yourusername/ZALAMATI/discussions)
- 📧 [Email Support](mailto:support@zalamati.dev)

## 🙏 Acknowledgments

- [LangChain](https://langchain.com/) for agent orchestration
- [FastAPI](https://fastapi.tiangolo.com/) for the backend framework
- [React](https://reactjs.org/) for the frontend framework
- [Material-UI](https://mui.com/) for UI components
- [Google Gemini](https://ai.google/) for AI capabilities

---

<div align="center">

**Built with ❤️ for the AI automation community**

[⭐ Star this repo](https://github.com/yourusername/ZALAMATI) • [🐛 Report Bug](https://github.com/yourusername/ZALAMATI/issues) • [💡 Request Feature](https://github.com/yourusername/ZALAMATI/issues)

</div>
