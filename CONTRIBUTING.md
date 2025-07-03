# Contributing to ZALAMATI

Thank you for your interest in contributing to ZALAMATI! We welcome contributions from the community and appreciate your help in making this project better.

## 🚀 Quick Start

1. Fork the repository
2. Clone your fork: `git clone https://github.com/yourusername/ZALAMATI.git`
3. Create a feature branch: `git checkout -b feature/amazing-feature`
4. Make your changes
5. Test your changes
6. Commit your changes: `git commit -m 'Add amazing feature'`
7. Push to the branch: `git push origin feature/amazing-feature`
8. Open a Pull Request

## 📋 Development Setup

### Prerequisites

- Python 3.9+
- Node.js 16+
- Git

### Environment Setup

1. **Backend Setup**
   ```bash
   cd backend
   python -m venv venv
   source venv/bin/activate  # Linux/Mac
   # OR
   .\venv\Scripts\activate   # Windows
   pip install -r requirements.txt
   pip install -r requirements-dev.txt
   ```

2. **Frontend Setup**
   ```bash
   cd frontend
   npm install
   npm install --include=dev
   ```

3. **Pre-commit Hooks**
   ```bash
   pre-commit install
   ```

## 🔧 Development Guidelines

### Code Style

#### Python
- **Formatter**: Black
- **Import Sorting**: isort
- **Linting**: flake8, pylint
- **Type Checking**: mypy

```bash
# Format code
black .
isort .

# Lint code
flake8 .
pylint app/

# Type checking
mypy app/
```

#### TypeScript/JavaScript
- **Formatter**: Prettier
- **Linting**: ESLint
- **Style Guide**: Airbnb

```bash
# Format code
npm run format

# Lint code
npm run lint
npm run lint:fix
```

### Testing

#### Backend Tests
```bash
cd backend
pytest tests/ -v --cov=app
```

#### Frontend Tests
```bash
cd frontend
npm test
npm run test:coverage
```

#### Integration Tests
```bash
# Start backend and frontend
# Then run integration tests
npm run test:e2e
```

### Commit Guidelines

We follow [Conventional Commits](https://www.conventionalcommits.org/):

- `feat:` New features
- `fix:` Bug fixes
- `docs:` Documentation changes
- `style:` Code style changes (formatting, etc.)
- `refactor:` Code refactoring
- `test:` Adding or updating tests
- `chore:` Maintenance tasks

Example:
```
feat(tools): add OCR capabilities to GUI automation

- Implement text recognition using Tesseract
- Add confidence threshold configuration
- Update GUI automation tool to support text-based clicking
```

## 🐛 Bug Reports

When filing a bug report, please include:

1. **Environment Information**
   - OS and version
   - Python version
   - Node.js version
   - Browser (if frontend issue)

2. **Steps to Reproduce**
   - Clear, numbered steps
   - Expected behavior
   - Actual behavior

3. **Additional Context**
   - Screenshots (if applicable)
   - Log files
   - Configuration files (without sensitive data)

## 💡 Feature Requests

For feature requests:

1. Check existing issues to avoid duplicates
2. Provide clear description of the feature
3. Explain the use case and benefits
4. Consider implementation complexity
5. Be open to discussion and feedback

## 📁 Project Structure

```
ZALAMATI/
├── backend/
│   ├── app/
│   │   ├── agents/         # AI agent implementations
│   │   ├── api/           # API routes and endpoints
│   │   ├── core/          # Core utilities and config
│   │   ├── models/        # Data models
│   │   ├── services/      # Business logic services
│   │   └── tools/         # Agent tools
│   ├── tests/             # Backend tests
│   └── requirements.txt   # Python dependencies
├── frontend/
│   ├── src/
│   │   ├── components/    # React components
│   │   ├── hooks/         # Custom React hooks
│   │   ├── services/      # API services
│   │   ├── stores/        # State management
│   │   ├── types/         # TypeScript types
│   │   └── utils/         # Utility functions
│   └── package.json       # Node.js dependencies
├── docs/                  # Documentation
└── scripts/              # Build and deployment scripts
```

## 🧪 Adding New Features

### Adding a New Tool

1. **Create Tool Class**
   ```python
   # backend/app/tools/my_new_tool.py
   from langchain.tools import BaseTool
   from pydantic import BaseModel, Field

   class MyNewToolInput(BaseModel):
       param1: str = Field(description="Description of param1")

   class MyNewTool(BaseTool):
       name = "my_new_tool"
       description = "Description of what the tool does"
       args_schema = MyNewToolInput

       def _run(self, param1: str) -> str:
           # Implementation here
           return "Result"
   ```

2. **Register Tool**
   ```python
   # backend/app/agents/main_agent.py
   from app.tools.my_new_tool import MyNewTool

   def _initialize_tools(self):
       tools = [
           # ... existing tools
           MyNewTool(),
       ]
       return tools
   ```

3. **Add API Endpoint** (optional)
   ```python
   # backend/app/api/routes.py
   @api_router.post("/my_new_tool/")
   async def use_my_new_tool(data: Dict[str, Any]) -> str:
       tool = MyNewTool()
       return await tool.arun(**data)
   ```

4. **Add Tests**
   ```python
   # backend/tests/test_my_new_tool.py
   import pytest
   from app.tools.my_new_tool import MyNewTool

   def test_my_new_tool():
       tool = MyNewTool()
       result = tool.run(param1="test")
       assert result == "expected_result"
   ```

### Adding Frontend Components

1. **Create Component**
   ```typescript
   // frontend/src/components/MyComponent.tsx
   import React from 'react';
   import { Box, Typography } from '@mui/material';

   interface MyComponentProps {
     title: string;
   }

   export const MyComponent: React.FC<MyComponentProps> = ({ title }) => {
     return (
       <Box>
         <Typography variant="h6">{title}</Typography>
       </Box>
     );
   };
   ```

2. **Add Tests**
   ```typescript
   // frontend/src/components/__tests__/MyComponent.test.tsx
   import { render, screen } from '@testing-library/react';
   import { MyComponent } from '../MyComponent';

   test('renders component with title', () => {
     render(<MyComponent title="Test Title" />);
     expect(screen.getByText('Test Title')).toBeInTheDocument();
   });
   ```

## 🔒 Security Considerations

- Never commit API keys or sensitive information
- Validate all user inputs
- Use parameterized queries for database operations
- Implement proper error handling
- Follow OWASP security guidelines

## 📝 Documentation

- Update README.md for new features
- Add docstrings to all Python functions
- Use JSDoc comments for TypeScript functions
- Update API documentation
- Include usage examples

## 🎯 Areas for Contribution

We welcome contributions in these areas:

### High Priority
- [ ] Enhanced error handling and recovery
- [ ] Performance optimizations
- [ ] Additional AI model integrations
- [ ] Improved security features
- [ ] Mobile responsiveness

### Medium Priority
- [ ] Plugin system for custom tools
- [ ] Enhanced GUI automation with OCR
- [ ] Voice interface integration
- [ ] Multi-language support
- [ ] Advanced analytics and monitoring

### Low Priority
- [ ] Themes and customization
- [ ] Additional export formats
- [ ] Integration with external services
- [ ] Performance monitoring dashboard

## 🤝 Code Review Process

1. All submissions require review
2. We use GitHub pull requests
3. Maintainers will review within 48 hours
4. Address feedback promptly
5. Squash commits before merging

## 📞 Getting Help

- **Discord**: [Join our community](https://discord.gg/zalamati)
- **GitHub Discussions**: [Ask questions](https://github.com/yourusername/ZALAMATI/discussions)
- **Email**: [developers@zalamati.dev](mailto:developers@zalamati.dev)

## 🏆 Recognition

Contributors will be:
- Listed in the README
- Mentioned in release notes
- Invited to the contributors team
- Given special Discord roles

Thank you for contributing to ZALAMATI! 🚀
