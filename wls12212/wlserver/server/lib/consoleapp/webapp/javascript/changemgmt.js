/*
  Functions used by the ChangeManager jsp

  Copyright (c) 2003,2008, Oracle and/or its affiliates. All rights reserved.
*/

// Disable frame hijacking
if (top != self) top.location.href = location.href;
/*   this was in CL# 1677131 which causes regression ; revert it for now
<style>
html {visibility:hidden;}
</style>
<script type="text/javascript">
if (self===top) {
   document.documentElement.style.visibility='visible';
} else {
   top.location=self.location;
}
</script>
*/

function doChangeCenter(action){
  // if this page can be edited, see if it has been modified
  if (window.changeCenterCheck && changeCenterCheck()) {
    restoreButtons();
    return;
  }

  // either this page is not editable, or has not been changed, or has been 
  // changed and the user cancelled the edits
  // do the action of the change center button that was clicked
  wls.console.doingSubmit();
  document.changecenterform.ChangeManagerPortletreturnTo.value = parent.location.href;
  document.changecenterform.ChangeManagerPortlet_actionOverride.value = action;
  document.changecenterform.submit();
}
