import sys
import secrets

from st2common.runners.base_action import Action

class generatePasswordAction(Action):
    def run(self, length):
        return(True, secrets.token_urlsafe(length))