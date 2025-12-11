from typing import Optional, List, Dict, TypedDict

class AgentState(TypedDict, total=False):
    """Simple TypedDict state for the agent."""
    user_message: Optional[str]
    extracted_content: Optional[str]
    intent: Optional[str]
    missing_info: Optional[str]
    action_taken: Optional[str]
    agent_response: Optional[str]
    file_path: Optional[str]
    chat_history: List[Dict]
    plan_log: List[str]
