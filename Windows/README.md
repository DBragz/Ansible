# Windows

## Built With

- [Windows 11](https://www.microsoft.com/en-us/windows/windows-11)

### Configuration on Deployed Machine

1. Go to *Network & internet* and select *Private Network* for all networks.

2. Run Windows Remote Management (WinRM) quick configuration. 

    ```PowerShell
    winrm quickconfig
    ```

3. Update the *Administrator* password.

    ```PowerShell
    net user Administrator NewPassword
    ```

4. Enable remote PowerShell connections.

    ```PowerShell
    Enable-PSRemoting -Force
    ```

5. Update the `hosts` file to contain the following parmeters.

    ```hosts
    [windows]
    pi_ip_address ansible_user=Administrator ansible_password=NewPassword ansible_connection=winrm ansible_winrm_transport=ntlm ansible_port=5985
    ```

### Test

```bash
# Run Ping Module
ansible windows -i hosts.ini -m win_ping

# Run PowerShell Commands
ansible windows -m ansible.windows.win_shell -a "Get-ComputerInfo"
```


## Authors

* [Daniel Ribeirinha-Braga](https://github.com/DBragz)
