# ZALAMATI - Setup and Deployment Guide

ZALAMATI is a highly advanced and fully autonomous AI agentic application with multi-modal capabilities including GUI control, system commands, web browsing, file operations, and more.

## 🚀 Features

- **Multi-Modal Control**: GUI automation, CMD/PowerShell execution, web browsing
- **Advanced AI Models**: Support for Gemini, OpenAI, and other APIs
- **Real-time Communication**: WebSocket-based agent interaction
- **Continuous Mode**: Autonomous multi-step execution
- **Memory System**: Context-aware conversation history
- **Modern UI**: React + TypeScript frontend similar to Manus AI
- **Comprehensive Tools**: File ops, directory management, web search, system commands

## 📋 Prerequisites

### System Requirements
- **Operating System**: Windows 10/11 (optimized for Windows)
- **Python**: 3.9 or higher
- **Node.js**: 16.x or higher
- **npm**: 8.x or higher

### Required Software
```bash
# Check versions
python --version
node --version
npm --version
```

## 🛠️ Installation

### 1. Backend Setup

Navigate to the backend directory:
```bash
cd ZALAMATI/backend
```

Create and activate a virtual environment:
```bash
python -m venv venv
.\venv\Scripts\Activate.ps1  # PowerShell
# OR
.\venv\Scripts\activate.bat  # CMD
```

Install Python dependencies:
```bash
pip install -r requirements.txt
```

### 2. Environment Configuration

Copy and configure the environment file:
```bash
cp .env.example .env  # If .env.example exists
# OR edit the existing .env file
```

Edit `.env` file with your API keys:
```env
# API Keys (Get these from respective providers)
GEMINI_API_KEY=your_actual_gemini_api_key_here
OPENAI_API_KEY=your_openai_api_key_here
ANTHROPIC_API_KEY=your_anthropic_api_key_here

# Server Settings
HOST=localhost
PORT=8000
DEBUG=true
```

### 3. Frontend Setup

Navigate to the frontend directory:
```bash
cd ../frontend
```

Install Node.js dependencies:
```bash
npm install
```

## 🚀 Running the Application

### Start Backend Server
```bash
cd backend
python main.py
```

The backend will be available at: `http://localhost:8000`

### Start Frontend Development Server
```bash
cd frontend
npm start
```

The frontend will be available at: `http://localhost:3000`

## 🔧 API Keys Setup

### Gemini API Key (Recommended - Free)
1. Go to [Google AI Studio](https://makersuite.google.com/app/apikey)
2. Create a new API key
3. Add it to your `.env` file as `GEMINI_API_KEY`

### OpenAI API Key (Optional)
1. Go to [OpenAI API Keys](https://platform.openai.com/api-keys)
2. Create a new secret key
3. Add it to your `.env` file as `OPENAI_API_KEY`

### Anthropic API Key (Optional)
1. Go to [Anthropic Console](https://console.anthropic.com/)
2. Create a new API key
3. Add it to your `.env` file as `ANTHROPIC_API_KEY`

## 🧪 Testing the Setup

### Test Backend
```bash
# Test if backend is running
curl http://localhost:8000/health

# Test agent endpoint
curl -X POST http://localhost:8000/api/web_search/ \
  -H "Content-Type: application/json" \
  -d '{"query": "AI news", "num_results": 3}'
```

### Test Frontend
1. Open browser to `http://localhost:3000`
2. You should see the ZALAMATI interface
3. Check browser console for any errors

## 🔧 Advanced Configuration

### Security Settings
```env
# Change in production
SECRET_KEY=your-super-secret-key-here
ACCESS_TOKEN_EXPIRE_MINUTES=30
```

### Agent Settings
```env
MAX_ITERATIONS=50
ENABLE_CONTINUOUS_MODE=true
MEMORY_SIZE=1000
```

### File Operation Limits
```env
MAX_FILE_SIZE=10485760  # 10MB
ALLOWED_FILE_EXTENSIONS=.txt,.md,.json,.yaml,.yml,.py,.js,.ts,.html,.css,.xml,.csv,.log
```

## 🎯 Usage Examples

### Basic Agent Interaction
1. Start both backend and frontend
2. Open the web interface
3. Type commands like:
   - "List files in the current directory"
   - "Search for latest AI news"
   - "Take a screenshot"
   - "Run PowerShell command 'Get-Process'"

### API Usage
```python
import requests

# File operations
response = requests.post('http://localhost:8000/api/file_operations/', json={
    "action": "read",
    "file_path": "example.txt"
})

# Web search
response = requests.post('http://localhost:8000/api/web_search/', json={
    "query": "Python programming",
    "num_results": 5
})

# System commands
response = requests.post('http://localhost:8000/api/system_commands/', json={
    "command": "dir",
    "shell": "cmd"
})
```

## 🚀 Production Deployment

### Backend Deployment (Using Gunicorn)
```bash
pip install gunicorn
gunicorn main:app --host 0.0.0.0 --port 8000 --workers 4
```

### Frontend Deployment
```bash
npm run build
# Serve the build folder with a web server
```

### Docker Deployment (Optional)
Create `Dockerfile` for backend:
```dockerfile
FROM python:3.9-slim
WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY . .
CMD ["python", "main.py"]
```

## 🛡️ Security Considerations

1. **API Keys**: Never commit API keys to version control
2. **CORS**: Configure appropriate CORS settings for production
3. **Authentication**: Implement user authentication for production use
4. **Rate Limiting**: Add rate limiting to prevent abuse
5. **Input Validation**: All user inputs are validated and sanitized

## 🔍 Troubleshooting

### Common Issues

**Backend won't start**:
- Check Python version and virtual environment
- Verify all dependencies are installed
- Check if port 8000 is available

**Frontend won't start**:
- Clear npm cache: `npm cache clean --force`
- Delete node_modules and reinstall: `rm -rf node_modules && npm install`
- Check Node.js version compatibility

**API Key errors**:
- Verify API keys are correct and active
- Check .env file format and variable names
- Restart backend after changing .env

**GUI automation not working**:
- Ensure PyAutoGUI dependencies are installed
- Check screen resolution and permissions
- Disable GUI fail-safe if needed (for development only)

### Logging
Check logs in:
- Backend: `zalamati.log`
- Frontend: Browser developer console
- System: Windows Event Viewer (for system-level issues)

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests if applicable
5. Submit a pull request

## 📄 License

MIT License - see LICENSE file for details

## 🆘 Support

For issues and questions:
1. Check the troubleshooting section
2. Search existing issues
3. Create a new issue with detailed information

---

**Note**: This is a powerful automation tool. Use responsibly and ensure you have appropriate permissions before running system commands or GUI automation on production systems.
